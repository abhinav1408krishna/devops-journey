#!/usr/bin/env bash
set -u

echo "======================================"
echo " Disk and Resource Inspection"
echo "======================================"
echo

echo "=== Disk Space ==="
df -h
echo

echo "=== Filesystem Types ==="
df -hT
echo

echo "=== Memory and Swap ==="
free -h
echo

echo "=== Load Average ==="
if [[ -r /proc/loadavg ]]; then
    cat /proc/loadavg
else
    uptime
fi
echo

echo "=== Disk Usage of Lab Directory ==="
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
du -sh "$PROJECT_DIR/lab-data" 2>/dev/null || true
echo

echo "Inspection complete. No resources were modified."
