#!/usr/bin/env bash

set -u

echo "======================================"
echo " Package Management Inspection"
echo "======================================"
echo

echo "=== Operating System ==="
if [[ -r /etc/os-release ]]; then
    . /etc/os-release
    printf 'Distribution: %s\n' "${PRETTY_NAME:-Unknown}"
fi
echo

echo "=== APT Version ==="
apt --version
echo

echo "=== Installed Package Count ==="
dpkg-query -f='${binary:Package}\n' -W 2>/dev/null | wc -l
echo

echo "=== Bash Package Policy ==="
apt-cache policy bash
echo

echo "=== Sample Installed Packages ==="
dpkg-query -W -f='${binary:Package} ${Version}\n' 2>/dev/null | head -n 10
echo

echo "Inspection complete. No packages were changed."
