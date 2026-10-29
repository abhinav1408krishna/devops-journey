#!/usr/bin/env bash
set -euo pipefail

echo "=== Disposable Process Cleanup Test ==="

sleep 300 &
test_pid=$!

cleanup() {
    kill "$test_pid" 2>/dev/null || true
    wait "$test_pid" 2>/dev/null || true
}
trap cleanup EXIT

if ! kill -0 "$test_pid" 2>/dev/null; then
    echo "FAIL: disposable process did not start" >&2
    exit 1
fi

echo "PASS: disposable process started (PID $test_pid)"

kill "$test_pid"

if wait "$test_pid" 2>/dev/null; then
    echo "FAIL: expected the terminated process to return a nonzero status" >&2
    exit 1
fi

trap - EXIT
echo "PASS: disposable process terminated and was reaped"
