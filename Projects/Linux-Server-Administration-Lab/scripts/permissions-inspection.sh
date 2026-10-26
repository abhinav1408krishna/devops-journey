#!/usr/bin/env bash

set -u

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LAB_DIR="$PROJECT_DIR/lab-data"

echo "======================================"
echo " File Ownership and Permissions"
echo "======================================"
echo

echo "=== Lab Directory ==="
stat -c 'Permissions: %A (%a) | Owner: %U | Group: %G | Path: %n' "$LAB_DIR"
echo

echo "=== Lab Files ==="
if find "$LAB_DIR" -maxdepth 1 -type f -print -quit | grep -q .; then
    find "$LAB_DIR" -maxdepth 1 -type f -exec \
        stat -c 'Permissions: %A (%a) | Owner: %U | Group: %G | Path: %n' {} \;
else
    echo "No files found in lab-data."
fi

echo
echo "Inspection complete."
