#!/usr/bin/env bash
#
# `make cover`: measure line coverage of the SDK library (lib/) and fail when it
# drops below the threshold (default 80%, override with the first argument or the
# COVERAGE_THRESHOLD environment variable). The gate itself is the shared
# scripts/coverage.py, which also writes coverage/coverage-{badge,summary}.json.
#
# Usage:
#   ./scripts/coverage.sh                    # gate at 80%
#   ./scripts/coverage.sh 90                 # gate at 90%
#   COVERAGE_THRESHOLD=99 ./scripts/coverage.sh
#
set -euo pipefail

THRESHOLD="${1:-${COVERAGE_THRESHOLD:-80}}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "${SCRIPT_DIR}")"
cd "${ROOT_DIR}"

export PATH="${PATH}:${HOME}/.pub-cache/bin"

echo "==> dart pub get"
dart pub get

echo "==> Activating coverage tool (if needed)"
dart pub global activate coverage >/dev/null

echo "==> Running tests with coverage"
rm -rf coverage
dart test --coverage=coverage

echo "==> Formatting coverage to LCOV"
dart pub global run coverage:format_coverage \
  --lcov \
  --in=coverage \
  --out=coverage/lcov.info \
  --report-on=lib

echo "==> Checking line coverage"
# `python`, or `python3` where only that exists (e.g. a stock Ubuntu 26.04).
python="$(command -v python || command -v python3)"
"${python}" scripts/coverage.py lcov coverage/lcov.info --threshold "${THRESHOLD}"
