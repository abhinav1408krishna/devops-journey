#!/usr/bin/env bash

set -u

echo "======================================"
echo " Process Management Inspection"
echo "======================================"
echo

echo "=== Current Shell ==="
printf 'PID: %s\n' "$$"
ps -p "$$" -o pid,ppid,user,stat,comm
echo

echo "=== Process Count ==="
ps -e --no-headers | wc -l
echo

echo "=== Top 10 Processes by CPU ==="
ps -eo pid,ppid,user,stat,%cpu,%mem,comm --sort=-%cpu | head -n 11
echo

echo "=== Process State Reference ==="
echo "R = Running"
echo "S = Interruptible sleep"
echo "D = Uninterruptible sleep"
echo "T = Stopped or traced"
echo "Z = Zombie"
echo

echo "Inspection complete."
