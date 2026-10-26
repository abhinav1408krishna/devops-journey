#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT="$(bash "$PROJECT_DIR/scripts/logs-inspection.sh")"

for expected in \
    "Logs and Troubleshooting Inspection" \
    "=== Recent System Journal ===" \
    "=== Log Directory Overview ===" \
    "=== Troubleshooting Commands ===" \
    "Inspection complete. No logs or services were changed."
do
    grep -Fq -- "$expected" <<< "$OUTPUT" || {
        echo "FAIL: Missing: $expected" >&2
        exit 1
    }
    echo "PASS: $expected"
done
echo "All logs inspection tests passed."
