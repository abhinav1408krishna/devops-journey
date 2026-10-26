#!/usr/bin/env bash

set -u

echo "======================================"
echo " Service Management Inspection"
echo "======================================"
echo

echo "=== System Manager State ==="
systemctl is-system-running || true
echo

echo "=== Running Services ==="
systemctl list-units --type=service --state=running --no-pager
echo

echo "=== Selected Service Details ==="
for service_name in cron docker containerd; do
    echo "--- ${service_name}.service ---"
    if systemctl show "${service_name}.service" \
        --property=LoadState,ActiveState,SubState,UnitFileState --no-pager 2>/dev/null; then
        :
    else
        echo "Unable to inspect ${service_name}.service"
    fi
    echo
done

echo "Inspection complete. No service states were changed."
