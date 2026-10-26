#!/usr/bin/env bash
set -u

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RUNNER="$PROJECT_DIR/scripts/lab-runner.sh"
REPORT="$PROJECT_DIR/local-output/automation-run-report.txt"

passed=0
failed=0

assert_contains() {
    local expected="$1"
    local file="$2"

    if grep -Fq -- "$expected" "$file"; then
        echo "PASS: found '$expected'"
        passed=$((passed + 1))
    else
        echo "FAIL: missing '$expected'"
        failed=$((failed + 1))
    fi
}

echo "=== Lab Runner Test ==="

if bash "$RUNNER"; then
    echo "PASS: lab runner exited successfully"
    passed=$((passed + 1))
else
    echo "FAIL: lab runner returned an error"
    failed=$((failed + 1))
fi

if [[ -f "$REPORT" ]]; then
    echo "PASS: automation report exists"
    passed=$((passed + 1))

    assert_contains "Scripts run: 9" "$REPORT"
    assert_contains "Failures: 0" "$REPORT"
    assert_contains "Result: PASS" "$REPORT"
    assert_contains "Running: system-inspection.sh" "$REPORT"
    assert_contains "Running: logs-inspection.sh" "$REPORT"
    assert_contains "Running: resource-inspection.sh" "$REPORT"
else
    echo "FAIL: automation report was not created"
    failed=$((failed + 1))
fi

echo
echo "Assertions passed: $passed"
echo "Assertions failed: $failed"

(( failed == 0 ))
