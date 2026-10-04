#!/usr/bin/env python3
"""Negative tests: each case in tests/negative/ must fail to compile with the
expected error text. The manifest maps file names to required substrings.

Run: python3 tests/negative.py [--bicep /path/to/bicep]
"""
import argparse
import json
import pathlib
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
NEGATIVE = ROOT / 'tests' / 'negative'


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--bicep', default='bicep', help='bicep binary to use')
    args = parser.parse_args()

    manifest = json.load(open(NEGATIVE / 'manifest.json'))
    failures = []
    for name, pattern in sorted(manifest.items()):
        path = NEGATIVE / name
        result = subprocess.run(
            [args.bicep, 'build', str(path), '--stdout'],
            capture_output=True, text=True, cwd=ROOT)
        combined = result.stderr + result.stdout
        if result.returncode == 0:
            failures.append(f'{name}: expected a compile failure, but the build succeeded')
        elif pattern not in combined:
            failures.append(f'{name}: expected an error containing {pattern!r}, got: {combined.strip()[:200]!r}')
        else:
            print(f'PASS  {name}: rejected as expected')

    for f in failures:
        print(f'FAIL  {f}')
    if failures:
        print(f'{len(failures)} negative test(s) failed')
        return 1
    print(f'all {len(manifest)} negative tests passed')
    return 0


if __name__ == '__main__':
    sys.exit(main())
