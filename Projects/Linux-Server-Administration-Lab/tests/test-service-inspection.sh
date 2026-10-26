#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT="$PROJECT_DIR/scripts/service-inspection.sh"
OUTPUT="$(bash "$SCRIPT")"

assert_contains() {
    local expected="$1"

    if grep -Fq -- "$expected" <<< "$OUTPUT"; then
        printf 'PASS: Found "%s"\n' "$expected"
    else
        printf 'FAIL: Missing "%s"\n' "$expected" >&2
        exit 1
    fi
}

assert_contains "Service Management Inspection"
assert_contains "=== System Manager State ==="
assert_contains "=== Running Services ==="
assert_contains "=== Selected Service Details ==="
assert_contains "--- cron.service ---"
assert_contains "--- docker.service ---"
assert_contains "--- containerd.service ---"
assert_contains "ActiveState="
assert_contains "SubState="
assert_contains "Inspection complete. No service states were changed."

echo
echo "All service inspection tests passed."
