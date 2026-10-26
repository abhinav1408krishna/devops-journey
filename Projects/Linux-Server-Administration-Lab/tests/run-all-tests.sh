#!/usr/bin/env bash
set -uo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
passed=0
failed=0

for test_script in "$PROJECT_DIR"/tests/test-*.sh; do
    [[ -f "$test_script" ]] || continue
    echo
    echo "======================================"
    echo "Testing: $(basename "$test_script")"
    echo "======================================"

    if bash "$test_script"; then
        passed=$((passed + 1))
    else
        echo "FAILED: $(basename "$test_script")"
        failed=$((failed + 1))
    fi
done

echo
echo "======================================"
echo " End-to-End Test Summary"
echo "======================================"
echo "Test suites passed: $passed"
echo "Test suites failed: $failed"

(( failed == 0 ))
