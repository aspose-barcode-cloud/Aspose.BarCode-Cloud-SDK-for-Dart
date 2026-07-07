#!/usr/bin/env bash
#
# Measure line coverage of the generated SDK and fail when it drops below the
# threshold (default 80%, override with the first argument or the THRESHOLD
# environment variable).
#
# Usage:
#   ./scripts/coverage.sh          # gate at 80%
#   ./scripts/coverage.sh 90       # gate at 90%
#   THRESHOLD=99 ./scripts/coverage.sh
#
set -euo pipefail

THRESHOLD="${1:-${THRESHOLD:-80}}"

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

echo "==> Computing line coverage"
PCT="$(awk -F: '
  /^LH:/ { hit += $2 }
  /^LF:/ { found += $2 }
  END {
    if (found == 0) { print "0"; exit }
    printf "%.2f", 100 * hit / found
  }
' coverage/lcov.info)"

echo "Line coverage: ${PCT}% (threshold: ${THRESHOLD}%)"

# Bash cannot compare floats; delegate the comparison to awk.
if awk -v p="${PCT}" -v t="${THRESHOLD}" 'BEGIN { exit !(p + 0 < t + 0) }'; then
  echo "FAIL: line coverage ${PCT}% is below the ${THRESHOLD}% threshold" >&2
  exit 1
fi

echo "OK: line coverage ${PCT}% meets the ${THRESHOLD}% threshold"
