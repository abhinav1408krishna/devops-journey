#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT="$PROJECT_DIR/scripts/process-inspection.sh"
OUTPUT="$(bash "$SCRIPT")"

assert_contains() {
    local expected="$1"

    if grep -Fq "$expected" <<< "$OUTPUT"; then
        printf 'PASS: Found "%s"\n' "$expected"
    else
        printf 'FAIL: Missing "%s"\n' "$expected" >&2
        exit 1
    fi
}

assert_contains "Process Management Inspection"
assert_contains "=== Current Shell ==="
assert_contains "=== Process Count ==="
assert_contains "=== Top 10 Processes by CPU ==="
assert_contains "=== Process State Reference ==="
assert_contains "R = Running"
assert_contains "S = Interruptible sleep"
assert_contains "D = Uninterruptible sleep"
assert_contains "T = Stopped or traced"
assert_contains "Z = Zombie"
assert_contains "Inspection complete."

echo
echo "All process inspection tests passed."
