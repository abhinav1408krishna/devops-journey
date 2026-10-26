#!/usr/bin/env bash
set -uo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPORT="$PROJECT_DIR/local-output/automation-run-report.txt"

scripts=(
    system-inspection.sh
    filesystem-inspection.sh
    user-group-inspection.sh
    permissions-inspection.sh
    process-inspection.sh
    package-inspection.sh
    service-inspection.sh
    logs-inspection.sh
    resource-inspection.sh
)

{
    echo "Linux Server Administration Lab - Automated Run"
    echo "Started: $(date --iso-8601=seconds)"
    echo
} > "$REPORT"

failures=0

for script_name in "${scripts[@]}"; do
    script_path="$PROJECT_DIR/scripts/$script_name"
    {
        echo "======================================"
        echo "Running: $script_name"
        echo "======================================"
    } >> "$REPORT"

    if bash "$script_path" >> "$REPORT" 2>&1; then
        echo "PASS: $script_name"
        echo "Result: PASS" >> "$REPORT"
    else
        echo "FAIL: $script_name"
        echo "Result: FAIL" >> "$REPORT"
        failures=$((failures + 1))
    fi
    echo >> "$REPORT"
done

{
    echo "Finished: $(date --iso-8601=seconds)"
    echo "Scripts run: ${#scripts[@]}"
    echo "Failures: $failures"
} >> "$REPORT"

echo "Automation report: $REPORT"
echo "Scripts run: ${#scripts[@]}"
echo "Failures: $failures"

(( failures == 0 ))
