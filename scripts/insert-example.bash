#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

dart run "${SCRIPT_DIR}/insert-example.dart"
rm -f "README.template"
