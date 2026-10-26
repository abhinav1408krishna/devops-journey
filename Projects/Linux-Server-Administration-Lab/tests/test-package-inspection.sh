#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT="$PROJECT_DIR/scripts/package-inspection.sh"
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

assert_contains "Package Management Inspection"
assert_contains "=== Operating System ==="
assert_contains "Ubuntu"
assert_contains "=== APT Version ==="
assert_contains "apt "
assert_contains "=== Installed Package Count ==="
assert_contains "=== Bash Package Policy ==="
assert_contains "Installed:"
assert_contains "Candidate:"
assert_contains "=== Sample Installed Packages ==="
assert_contains "Inspection complete. No packages were changed."

echo
echo "All package inspection tests passed."
