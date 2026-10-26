#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT="$PROJECT_DIR/scripts/user-group-inspection.sh"
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

assert_contains "User and Group Inspection"
assert_contains "=== Current User ==="
assert_contains "=== Group Memberships ==="
assert_contains "=== Account Record ==="
assert_contains "=== Primary Group Record ==="
assert_contains "=== Selected System Groups ==="
assert_contains "Inspection complete."

echo
echo "All user and group inspection tests passed."
