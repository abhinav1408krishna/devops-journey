# Baseline System Inspection

## Purpose

Record the initial state of a Linux environment before implementing the Linux Server Administration Lab.

## Checks Performed

| Check | Command | Evidence recorded |
|---|---|---|
| Operating system | `cat /etc/os-release` | Distribution and version |
| Kernel and architecture | `uname -a` | Kernel and architecture |
| Uptime and load | `uptime` | Uptime and load averages |
| Filesystem capacity | `df -h` | Filesystem capacity and utilization |
| Memory and swap | `free -h` | Memory and swap usage |

## Findings

- The baseline inspection covers five system-information checks.
- Filesystem utilization should be interpreted per mount point.
- Memory and swap values describe the environment visible to Linux.
- Actual results vary between machines and between inspection times.

## Verification Status

- [x] Operating system inspection documented.
- [x] Kernel and architecture inspection documented.
- [x] Uptime and load inspection documented.
- [x] Filesystem capacity inspection documented.
- [x] Memory and swap inspection documented.

## Limitations

This file is a sanitized description of the inspection procedure, not a transcript of a specific machine's output. It does not establish application health, network connectivity, service health, or production readiness.
