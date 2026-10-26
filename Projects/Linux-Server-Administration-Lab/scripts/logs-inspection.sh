#!/usr/bin/env bash
set -u

echo "======================================"
echo " Logs and Troubleshooting Inspection"
echo "======================================"
echo

echo "=== Recent System Journal ==="
if command -v journalctl >/dev/null 2>&1; then
    journalctl -n 20 --no-pager 2>&1 || true
else
    echo "journalctl is unavailable."
fi
echo

echo "=== Log Directory Overview ==="
if [[ -d /var/log ]]; then
    ls -lah /var/log | head -n 20
else
    echo "/var/log is unavailable."
fi
echo

echo "=== Troubleshooting Commands ==="
echo "Inspect service status: systemctl status SERVICE"
echo "Inspect recent journal: journalctl -n 50 --no-pager"
echo "Inspect a service journal: journalctl -u SERVICE -n 50 --no-pager"
echo
echo "Inspection complete. No logs or services were changed."
