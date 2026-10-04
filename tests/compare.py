#!/usr/bin/env python3
"""Compares a compiled .bicepparam parameters file against the golden file.

Run: python3 tests/compare.py <actual-parameters.json> <expected-parameters.json>
"""
import json
import sys


def main():
    if len(sys.argv) != 3:
        print(__doc__)
        return 2
    actual = json.load(open(sys.argv[1]))['parameters']
    expected = json.load(open(sys.argv[2]))['parameters']

    failures = []
    for key in sorted(set(actual) | set(expected)):
        if key not in actual:
            failures.append(f'{key}: missing from actual (expected {expected[key]!r})')
        elif key not in expected:
            failures.append(f'{key}: unexpected in actual (got {actual[key]!r})')
        elif actual[key] != expected[key]:
            failures.append(f'{key}: got {actual[key]!r}, expected {expected[key]!r}')

    for f in failures:
        print(f'FAIL  {f}')
    if failures:
        print(f'{len(failures)} assertion(s) failed')
        return 1
    print(f'all {len(expected)} assertions passed')
    return 0


if __name__ == '__main__':
    sys.exit(main())
