#!/usr/bin/env bash

set -u

CURRENT_USER="${USER:-$(id -un)}"

echo "======================================"
echo " User and Group Inspection"
echo "======================================"
echo

echo "=== Current User ==="
id "$CURRENT_USER"
echo

echo "=== Group Memberships ==="
groups "$CURRENT_USER"
echo

echo "=== Account Record ==="
getent passwd "$CURRENT_USER"
echo

echo "=== Primary Group Record ==="
PRIMARY_GID="$(id -g "$CURRENT_USER")"
getent group "$PRIMARY_GID"
echo

echo "=== Selected System Groups ==="
for group_name in adm sudo users docker; do
    if getent group "$group_name"; then
        :
    else
        printf 'Group not found: %s\n' "$group_name"
    fi
done

echo
echo "Inspection complete."
