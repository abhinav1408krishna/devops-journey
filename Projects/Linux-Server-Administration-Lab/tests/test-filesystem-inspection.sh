#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT="$PROJECT_DIR/scripts/filesystem-inspection.sh"
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

assert_contains "Filesystem and Directory Inspection"
assert_contains "=== Lab Directory ==="
assert_contains "Status: Directory exists"
assert_contains "=== Directory Contents ==="
assert_contains "=== Filesystem Capacity ==="
assert_contains "=== Directory Metadata ==="
assert_contains "Inspection complete."

echo
echo "All filesystem inspection tests passed."
