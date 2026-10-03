#!/usr/bin/env python3
"""Evaluates the compiled naming test template and asserts the expected names.

Bicep user-defined functions are not constant-folded at build time, so the
compiled ARM template contains function-call expressions in its outputs. This
script implements the small subset of the ARM expression language that the
naming module compiles to, evaluates every output, and compares it with the
expected value. Run: python3 tests/verify.py <compiled-template.json>
"""
import json
import sys

EXPECTED = {
    'resourceGroupName': 'rg-contoso-demo-uks',
    'storageAccountName': 'stcontosodemouksshared',
    'webAppName': 'app-contoso-demo-uks-api',
    'keyVaultName': 'kv-contoso-demo-uks-shar',  # key vault max length 24, truncation applied
    'compactForced': 'appcontosodemouksapi',
    'truncatedName': 'stcontosodemoukssharedlo',  # storage max length 24, truncation applied
    'regionFromCli': 'euw',
    'regionFromDisplay': 'euw',
    'regionUnknownPassesThrough': 'notaregion',
    'resourceGroupAbbreviation': 'rg',
    'storageAccountMaxLength': 24,
    'segmentArrayOrder': 'app-contoso-demo-uks-api-web',
}


class ParseError(Exception):
    pass


def tokenize(expr):
    tokens = []
    i = 0
    while i < len(expr):
        c = expr[i]
        if c in " \t\n\r":
            i += 1
        elif c in "(),.[]":
            tokens.append(c)
            i += 1
        elif c == "'":
            j = i + 1
            buf = []
            while j < len(expr):
                if expr[j] == "'":
                    if j + 1 < len(expr) and expr[j + 1] == "'":  # '' escape
                        buf.append("'")
                        j += 2
                    else:
                        j += 1
                        break
                else:
                    buf.append(expr[j])
                    j += 1
            tokens.append(('str', ''.join(buf)))
            i = j
        else:
            j = i
            while j < len(expr) and expr[j] not in " \t\n\r(),.[]'":
                j += 1
            word = expr[i:j]
            if word in ('true', 'false', 'null'):
                tokens.append(('lit', {'true': True, 'false': False, 'null': None}[word]))
            else:
                try:
                    tokens.append(('num', int(word)))
                except ValueError:
                    tokens.append(('name', word))
            i = j
    return tokens


def parse(expr):
    tokens = tokenize(expr)
    pos = [0]

    def peek():
        return tokens[pos[0]] if pos[0] < len(tokens) else None

    def take(expected=None):
        t = peek()
        if t is None or (expected is not None and t != expected):
            raise ParseError(f'expected {expected}, got {t} in {expr!r}')
        pos[0] += 1
        return t

    def primary():
        t = take()
        node = None
        if t == '(':
            node = primary()
            take(')')
        elif isinstance(t, tuple) and t[0] in ('str', 'num', 'lit'):
            node = ('val', t[1])
        elif isinstance(t, tuple) and t[0] == 'name':
            name = t[1]
            if peek() == '.':
                parts = [name]
                while peek() == '.':
                    take('.')
                    parts.append(take()[1])
                name = '.'.join(parts)
            if peek() == '(':
                take('(')
                args = []
                if peek() != ')':
                    args.append(primary())
                    while peek() == ',':
                        take(',')
                        args.append(primary())
                take(')')
                node = ('call', name, args)
            else:
                node = ('name', name)
        else:
            raise ParseError(f'unexpected token {t} in {expr!r}')
        return postfix(node)

    def postfix(node):
        while True:
            if peek() == '.':
                take('.')
                node = ('prop', node, take()[1])
            elif peek() == '[':
                take('[')
                node = ('index', node, primary())
                take(']')
            else:
                return node

    result = primary()
    if pos[0] != len(tokens):
        raise ParseError(f'trailing tokens in {expr!r}')
    return result


def get(obj, key):
    if obj is None:
        return None
    if isinstance(obj, dict):
        return obj.get(key)
    raise ParseError(f'cannot index {type(obj)}')


class Evaluator:
    def __init__(self, template):
        self.template = template
        self.variables = template.get('variables', {})
        self.parameters = template.get('parameters', {})
        self.functions = {}
        for ns in template.get('functions', []):
            for name, spec in ns['members'].items():
                self.functions[f"{ns['namespace']}.{name}"] = spec
        self.lambda_stack = []

    def eval(self, node, env):
        kind = node[0]
        if kind == 'val':
            return node[1]
        if kind == 'name':
            raise ParseError(f'unknown bare name {node[1]!r}')
        if kind == 'prop':
            return get(self.eval(node[1], env), node[2])
        if kind == 'index':
            return get(self.eval(node[1], env), self.eval(node[2], env))
        if kind == 'call':
            return self.call(node[1], node[2], env)
        raise ParseError(f'unknown node {kind}')

    def eval_args(self, args, env):
        return [self.eval(a, env) for a in args]

    def call(self, name, args, env):
        if name in self.functions:
            spec = self.functions[name]
            values = self.eval_args(args, env)
            params = {p['name']: v for p, v in zip(spec['parameters'], values)}
            value = spec['output']['value']
            if isinstance(value, str) and value.startswith('[') and value.endswith(']'):
                value = value[1:-1]
            return self.eval(parse(value), params)
        if name == 'lambda':
            return ('closure', args[0][1], args[1])  # param name, body ast
        if name == 'lambdaVariables':
            return self.lambda_stack[-1][self.eval_args(args, env)[0]]
        if name == 'map':
            arr, closure = self.eval(args[0], env), self.eval(args[1], env)
            out = []
            for item in arr:
                self.lambda_stack.append({closure[1]: item})
                out.append(self.eval(closure[2], {}))
                self.lambda_stack.pop()
            return out
        if name == 'filter':
            arr, closure = self.eval(args[0], env), self.eval(args[1], env)
            out = []
            for item in arr:
                self.lambda_stack.append({closure[1]: item})
                keep = self.eval(closure[2], {})
                self.lambda_stack.pop()
                if keep:
                    out.append(item)
            return out
        vals = self.eval_args(args, env)
        if name == 'variables':
            v = self.variables[vals[0]]
            return self.eval(parse(v), {}) if isinstance(v, str) and v.startswith('[') else v
        if name == 'parameters':
            if env:
                return env.get(vals[0])
            spec = self.parameters[vals[0]]
            return spec.get('defaultValue')
        if name == 'coalesce':
            for v in vals:
                if v is not None:
                    return v
            return None
        if name == 'if':
            return vals[1] if vals[0] else vals[2]
        if name == 'equals':
            return vals[0] == vals[1]
        if name == 'not':
            return not vals[0]
        if name == 'toLower':
            return vals[0].lower()
        if name == 'replace':
            return vals[0].replace(vals[1], vals[2])
        if name == 'trim':
            return vals[0].strip()
        if name == 'join':
            return vals[1].join(vals[0])
        if name == 'concat':
            if all(isinstance(v, list) for v in vals):
                return [x for v in vals for x in v]
            return ''.join(vals)
        if name == 'createArray':
            return vals
        if name == 'take':
            return vals[0][:vals[1]]
        raise ParseError(f'unsupported function {name}')


def evaluate_output(template, name, spec):
    value = spec['value']
    if isinstance(value, str) and value.startswith('[') and value.endswith(']'):
        ev = Evaluator(template)
        return ev.eval(parse(value[1:-1]), {})
    return value


def main():
    if len(sys.argv) != 2:
        print(__doc__)
        return 2
    with open(sys.argv[1]) as f:
        template = json.load(f)
    failures = 0
    for name, expected in EXPECTED.items():
        actual = evaluate_output(template, name, template['outputs'][name])
        ok = actual == expected
        failures += 0 if ok else 1
        print(f"{'PASS' if ok else 'FAIL'}  {name}: {actual!r}" + ('' if ok else f' != {expected!r}'))
    if failures:
        print(f'{failures} assertion(s) failed')
        return 1
    print(f'all {len(EXPECTED)} assertions passed')
    return 0


if __name__ == '__main__':
    sys.exit(main())
