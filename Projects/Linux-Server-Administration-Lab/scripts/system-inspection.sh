#!/usr/bin/env bash

set -u

echo "======================================"
echo " Linux Server Administration Lab"
echo " System Inspection Report"
echo "======================================"
echo

echo "=== Operating System ==="
if [[ -r /etc/os-release ]]; then
    cat /etc/os-release
else
    echo "OS release information is unavailable."
fi
echo

echo "=== Kernel and Architecture ==="
uname -a
echo

echo "=== Uptime and Load ==="
uptime
echo

echo "=== Filesystem Usage ==="
df -h
echo

echo "=== Memory and Swap ==="
free -h
echo

echo "=== PID 1 ==="
ps -p 1 -o pid=,comm=,args=
echo

echo "=== systemd Status ==="
if command -v systemctl >/dev/null 2>&1; then
    systemctl is-system-running 2>&1 || true
else
    echo "systemctl is not installed."
fi

echo
echo "Inspection complete."
