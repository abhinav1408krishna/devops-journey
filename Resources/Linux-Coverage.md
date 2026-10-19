# Linux Fundamentals — Coverage Record

**DLOS Phase:** Phase 1 — Linux Fundamentals
**Status:** In Progress
**Primary External Course:** KodeKloud Linux Basics
**Coverage Source:** KodeKloud Linux Basics Course
**Last Updated:** 2026-10-19

---

# Purpose

This document records the relationship between the DLOS Linux Fundamentals curriculum and the completed KodeKloud Linux Basics course.

The purpose is to prevent unnecessary repetition while ensuring that all DLOS learning objectives are satisfied.

KodeKloud course material and labs are treated as completed prerequisite learning. DLOS will focus on remaining gaps, deeper understanding, integration, documentation, and independent project work.

---

# KodeKloud Coverage

The following KodeKloud Linux Basics sections and associated labs have been completed.

- [X] 01 — Introduction
- [X] 02 — Working With Shell I
- [X] 03 — Linux Core Concepts
- [X] 04 — Package Management
- [X] 05 — Working With Shell II
- [X] 06 — Security & File Permissions
- [X] 07 — Networking
- [X] 08 — Storage in Linux
- [X] 09 — Service Management with systemd
- [X] 10 — Client Demonstration / Troubleshooting

---

# DLOS Coverage Analysis

| DLOS Requirement          | KodeKloud Coverage       | DLOS Action                         | Status |
| ------------------------- | ------------------------ | ----------------------------------- | ------ |
| Filesystem                | Covered                  | Document and reinforce              | 🟢     |
| Shell                     | Covered                  | Document and reinforce              | 🟢     |
| Users & Groups            | Covered                  | Document and reinforce              | 🟢     |
| File Permissions          | Covered                  | Document and reinforce              | 🟢     |
| Editors                   | Covered                  | Document and reinforce              | 🟢     |
| Package Management        | Covered                  | Document and reinforce              | 🟢     |
| Process Management        | Not sufficiently covered | Focused DLOS learning               | 🔴     |
| Services / systemd        | Covered                  | Document and reinforce              | 🟢     |
| Environment Variables     | Not sufficiently covered | Focused DLOS learning               | 🔴     |
| Shell Scripting           | Basic shell coverage     | Deeper DLOS learning                | 🟡     |
| Logs                      | Partially covered        | Focused DLOS learning               | 🟡     |
| Cron                      | Covered                  | Document and reinforce              | 🟢     |
| SSH                       | Covered                  | Document and reinforce              | 🟢     |
| Linux Troubleshooting     | Covered                  | Reinforce through project           | 🟢     |
| Networking                | Covered as prerequisite  | Continue in Phase 2 at deeper level | 🔵     |
| Linux Storage             | Covered                  | Retain as additional knowledge      | 🔵     |
| Kernel / Boot / Runlevels | Covered                  | Retain as additional knowledge      | 🔵     |

---

# Remaining DLOS Linux Work

## 1. Process Management

Topics to cover:

- Process IDs
- Parent and child processes
- Process states
- `ps`
- `top`
- `htop`
- `pgrep`
- `pidof`
- `kill`
- `pkill`
- Signals
- Foreground and background processes
- Jobs
- `bg`
- `fg`
- Process priority
- `nice`
- `renice`
- Zombie processes
- Orphan processes
- Process troubleshooting

Status: ⬜ Not Started

---

## 2. Environment Variables

Topics to cover:

- Shell variables
- Environment variables
- `env`
- `printenv`
- `export`
- `unset`
- `$PATH`
- `$HOME`
- `$USER`
- `$SHELL`
- Variable inheritance
- `.bashrc`
- `.profile`
- PATH troubleshooting

Status: ⬜ Not Started

---

## 3. Bash Scripting

Topics to cover:

- Variables
- User input
- Positional arguments
- Conditionals
- Loops
- Functions
- Arrays
- Command substitution
- Pipes and redirection
- Exit codes
- Error handling
- `set -euo pipefail`
- Script debugging
- Automation

Status: ⬜ Not Started

---

## 4. Linux Logging

Topics to cover:

- `/var/log`
- `journalctl`
- `dmesg`
- `tail`
- `less`
- `grep`
- Log investigation
- Service failure investigation
- Basic root-cause analysis

Status: ⬜ Not Started

---

# DLOS Integration Work

After the remaining topics are completed:

- [ ] Consolidate Linux Knowledge Book
- [ ] Document KodeKloud coverage
- [ ] Complete DLOS Linux labs where required
- [ ] Complete Linux mini-projects
- [ ] Complete Linux Server Administration Lab
- [ ] Complete Linux interview preparation
- [ ] Complete Linux reflection
- [ ] Update LEARNING_TRACKER.md
- [ ] Satisfy Linux Definition of Done
- [ ] Commit documentation to Git
- [ ] Push to GitHub

---

# Linux Portfolio Project

## Linux Server Administration Lab

The project should demonstrate practical Linux administration skills including:

- Filesystem management
- Users and groups
- Permissions
- Package management
- Processes
- Services
- Environment configuration
- Logging
- SSH
- Scheduling
- Bash automation
- Troubleshooting

Status: ⬜ Not Started

---

# Future DLOS Automation Assignment

The Linux Bash scripting gap will eventually contribute to:

**DLOS Bash Automation Toolkit**

This is a future portfolio project and should not be started until the required Bash fundamentals have been learned.

---

# Completion Rule

Linux Fundamentals will not be marked complete solely because the KodeKloud Linux Basics course has been completed.

The DLOS Linux phase is complete only when:

- KodeKloud prerequisite coverage is documented
- DLOS gaps are completed
- Required hands-on work is complete
- Linux project is complete
- Knowledge Book is updated
- Interview readiness is demonstrated
- Reflection is completed
- Definition of Done is satisfied
- Learning Tracker is updated
- Changes are committed and pushed to GitHub

---

# Current Position

**Completed prerequisite:** KodeKloud Linux Basics

**Current DLOS focus:** Process Management

**Next:** Environment Variables

**Then:** Bash Scripting

**Then:** Linux Logging

**Final:** Linux Server Administration Lab
