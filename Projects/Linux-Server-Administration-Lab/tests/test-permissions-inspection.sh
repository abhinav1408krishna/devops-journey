#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT="$PROJECT_DIR/scripts/permissions-inspection.sh"
DEMO_FILE="$PROJECT_DIR/lab-data/permissions-demo.txt"
chmod 640 "$DEMO_FILE"

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

assert_contains "File Ownership and Permissions"
assert_contains "=== Lab Directory ==="
assert_contains "=== Lab Files ==="
assert_contains "Permissions: -rw-r----- (640)"
assert_contains "Owner: $(id -un)"
assert_contains "Group: $(id -gn)"
assert_contains "Path: $DEMO_FILE"
assert_contains "Inspection complete."

echo
echo "All permissions inspection tests passed."
