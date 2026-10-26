#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT="$(bash "$PROJECT_DIR/scripts/resource-inspection.sh")"

for expected in \
    "Disk and Resource Inspection" \
    "=== Disk Space ===" \
    "=== Filesystem Types ===" \
    "=== Memory and Swap ===" \
    "=== Load Average ===" \
    "=== Disk Usage of Lab Directory ===" \
    "Inspection complete. No resources were modified."
do
    grep -Fq -- "$expected" <<< "$OUTPUT" || {
        echo "FAIL: Missing: $expected" >&2
        exit 1
    }
    echo "PASS: $expected"
done
echo "All resource inspection tests passed."
