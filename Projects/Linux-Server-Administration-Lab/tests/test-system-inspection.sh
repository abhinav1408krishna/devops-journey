#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT="$PROJECT_DIR/scripts/system-inspection.sh"
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

assert_contains "System Inspection Report"
assert_contains "=== Operating System ==="
assert_contains "=== Kernel and Architecture ==="
assert_contains "=== Uptime and Load ==="
assert_contains "=== Filesystem Usage ==="
assert_contains "=== Memory and Swap ==="
assert_contains "=== PID 1 ==="
assert_contains "Inspection complete."

echo
echo "All system inspection tests passed."
