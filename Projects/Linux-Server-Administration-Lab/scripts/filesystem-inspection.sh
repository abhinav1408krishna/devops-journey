#!/usr/bin/env bash

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
LAB_DIR="$PROJECT_DIR/lab-data"

echo "======================================"
echo " Filesystem and Directory Inspection"
echo "======================================"
echo

echo "=== Lab Directory ==="
printf 'Path: %s\n' "$LAB_DIR"

if [[ -d "$LAB_DIR" ]]; then
    echo "Status: Directory exists"
else
    echo "Status: Directory does not exist"
    exit 1
fi
echo

echo "=== Directory Contents ==="
ls -lah "$LAB_DIR"
echo

echo "=== Filesystem Capacity ==="
df -h "$LAB_DIR"
echo

echo "=== Directory Metadata ==="
stat "$LAB_DIR"
echo

echo "Inspection complete."
