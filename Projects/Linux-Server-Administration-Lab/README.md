# Linux Server Administration Lab

## 1. Project Overview

- **Project Name:** Linux Server Administration Lab
- **DLOS Phase:** Linux Fundamentals and System Administration
- **Status:** In Progress
- **Difficulty:** Beginner to Intermediate
- **Intended Audience:** Beginners learning Linux administration and aspiring DevOps engineers
- **Operating System / Environment:** Ubuntu running on WSL2 (64-bit x86_64)
- **Estimated Effort:** 10–15 hours, completed incrementally alongside practical learning

### Project Summary

The Linux Server Administration Lab is a hands-on project designed to develop
practical Linux administration skills using a controlled Ubuntu environment.

The project will cover filesystem navigation, user and group management,
file permissions, process management, package management, service operations,
system logs, disk usage, troubleshooting, and basic Bash automation.

Each topic will include practical commands, explanations, validation steps,
and evidence of the results. The lab will be developed incrementally, with
implementation details documented as they are tested.

The initial implementation will use Ubuntu under WSL2. Where WSL2 behaves
differently from a conventional Linux server, those differences will be
documented rather than assumed to be identical.

## 2. Project Purpose and Objectives

### 2.1 What Is This Project?

The Linux Server Administration Lab is a practical learning project in which
Linux administration tasks are performed in a controlled Ubuntu environment.

Instead of learning commands only as theory, this project applies them to
realistic administrative scenarios, such as creating users, controlling file
access, inspecting running processes, managing software packages, investigating
logs, checking disk usage, and automating repetitive tasks.

The project will use Ubuntu under WSL2 for its initial implementation. Some
tasks may behave differently from a conventional Linux server, particularly
those involving system services and boot management. These differences will
be recorded during implementation.

### 2.2 Problem Statement

Linux is widely used to host applications, run infrastructure, execute
automation, and support cloud environments. A person working in DevOps or
system administration needs more than familiarity with individual commands:
they must be able to perform routine operations, verify results, and
investigate problems safely.

This project addresses that learning need by providing a structured,
repeatable lab in which administrative tasks can be practiced and tested.
It also creates documented evidence of the work completed.

### 2.3 Project Objectives

By completing this project, the learner should be able to:

- Navigate and manage the Linux filesystem.
- Create and manage users and groups.
- Understand file ownership and permissions and apply them appropriately.
- Inspect processes and perform basic process management.
- Install and manage software packages.
- Inspect and manage services where supported by the environment.
- Read system logs and use them to investigate problems.
- Check disk usage and basic system resource information.
- Write and execute simple Bash scripts to automate repetitive tasks.
- Validate changes using commands and observable results.
- Document troubleshooting steps, solutions, and lessons learned.
- Explain how Linux administration tasks relate to real operational work.

### 2.4 Skills and Technologies Required

| Category | Skills or technologies | Purpose |
|---|---|---|
| Operating system | Ubuntu Linux, WSL2 | Provides the lab environment |
| Command line | Bash shell and core Linux commands | Performs administrative tasks |
| Filesystem | Paths, directories, files, and disk usage | Organizes and inspects system data |
| Access management | Users, groups, ownership, permissions, sudo | Controls access to files and administrative operations |
| Process management | Process IDs, process inspection, signals | Inspects and manages running programs |
| Package management | APT and package verification | Installs and maintains software |
| Service management | systemctl and service diagnostics, where supported | Inspects and manages system services |
| Troubleshooting | Log inspection, command output, verification | Investigates and resolves problems |
| Scripting | Bash | Automates repeatable tasks |
| Version control | Git and GitHub | Tracks project documentation and code changes |

**Primary scripting language:** Bash.

Python is not required for the initial version. It may be considered as a future extension if a later project requirement justifies it.

### 2.5 Practical Uses of the Project

The skills practiced in this lab are relevant to tasks such as:

- Creating accounts and assigning appropriate access on Linux systems.
- Investigating why a process is consuming resources or has stopped.
- Checking logs when an application or service fails.
- Installing command-line tools and verifying their availability.
- Inspecting disk usage when a system is running low on space.
- Automating routine checks with shell scripts.
- Following a repeatable troubleshooting procedure and recording the outcome.

These are representative practice scenarios. The lab itself is a learning environment, not a production server or a production-ready administration platform.

### 2.6 Relationship to Industry Job Roles

| Job role | Relevant skills demonstrated by this project |
|---|---|
| Linux / System Administrator | User and group administration, permissions, processes, packages, services, and logs |
| DevOps Engineer | Linux command-line operations, Bash scripting, troubleshooting, and automation fundamentals |
| Site Reliability Engineer (SRE) | Basic system diagnostics, log investigation, resource checks, and repeatable operational procedures |
| Cloud / Infrastructure Engineer | Linux administration fundamentals that transfer to Linux-based cloud virtual machines |
| Technical Support / Operations Engineer | Command-line diagnostics, issue investigation, verification, and incident documentation |

The project develops foundational skills relevant to these roles. Completing this lab alone does not establish production-level expertise; more advanced projects will be needed to practice networking, containers, CI/CD, cloud infrastructure, configuration management, and monitoring.

### 2.7 Expected Deliverables

The expected deliverables are:

- A documented Linux administration lab.
- Reproducible setup and implementation instructions.
- Bash scripts and test procedures where appropriate.
- Recorded validation results and selected evidence.
- A troubleshooting guide based on issues actually encountered.
- A summary of skills practiced, limitations, and future improvements.

Deliverables will be added as the project is implemented. A planned deliverable must not be described as completed until it exists and has been checked.

### 2.8 Prerequisites

Before starting, the learner should have:

- Access to an Ubuntu environment under WSL2 or a suitable Linux system.
- Basic familiarity with opening a terminal and running commands.
- A Git repository in which project documentation can be maintained.
- Willingness to inspect command output and verify each operation.

Previous Linux experience is not required. Commands will be explained as they are introduced. Some tasks may require `sudo`; administrative commands will be explained before use, and destructive operations will be avoided unless their effects are understood.

## 3. Requirements and Setup

### 3.1 Required Tools

The initial lab uses Ubuntu under Windows Subsystem for Linux 2 (WSL2). The following tools were checked in the current environment.

| Tool | Purpose | Installation / Reference | Verification Command |
|---|---|---|---|
| Ubuntu on WSL2 | Linux environment for the lab | Existing environment | `uname -a` |
| Bash | Command interpreter and scripting | Included with Ubuntu | `bash --version` |
| Git | Version control for project files | Already available; otherwise install using APT | `git --version` |
| sudo | Execute authorized administrative commands | Included with Ubuntu | `sudo -v` |
| APT | Install and manage Ubuntu packages | Included with Ubuntu | `apt --version` |
| systemctl | Inspect and manage systemd units when supported | Availability confirmed; functionality requires verification | `systemctl --version` |
| journalctl | Read systemd journal logs when available | Availability confirmed; journal access requires verification | `journalctl --version` |
| ps | Inspect running processes | Included with Ubuntu | `ps --version` |
| df | Inspect filesystem space | Included with Ubuntu | `df -h` |
| free | Inspect memory usage | Included with Ubuntu | `free -h` |

**Environment check result:** The commands `bash`, `git`, `sudo`, `apt`, `systemctl`, `journalctl`, `df`, `free`, and `ps` were found in `/usr/bin`.

This confirms that the commands are available in the current shell. It does not yet confirm that every command can perform all operations required by the lab.

### 3.2 Environment Preparation

#### Step 1 — Confirm the Linux Environment

Run:

```bash
uname -a
```

The output should identify the Linux kernel and architecture. In the initial environment, the kernel information identifies WSL2 and the architecture is `x86_64`.

#### Step 2 — Confirm the Ubuntu Distribution

Run:

```bash
cat /etc/os-release
```

Inspect the `NAME`, `VERSION`, and `VERSION_ID` fields to identify the installed distribution and version. Record the actual values when validating the environment.

#### Step 3 — Confirm Required Commands

Run:

```bash
for cmd in bash git sudo apt systemctl journalctl df free ps; do
    if command -v "$cmd" >/dev/null 2>&1; then
        printf "%-12s %s\n" "$cmd" "$(command -v "$cmd")"
    else
        printf "%-12s NOT FOUND\n" "$cmd"
    fi
done
```

This checks whether each command is available through the shell's `PATH`. It does not test every command's functionality.

#### Step 4 — Check Administrative Access

Run:

```bash
sudo -v
```

Enter your password if prompted. A successful return indicates that sudo accepted the credentials for the current session. If access is denied, investigate the account's sudo permissions rather than attempting to bypass them.

#### Step 5 — Check Package Manager Configuration

Run:

```bash
apt --version
```

If package installation is required later, inspect the package manager's configuration and refresh its package index with:

```bash
sudo apt update
```

This updates package metadata; it does not upgrade installed packages. Review the output for repository or network errors before proceeding.

Do not install or upgrade packages unless a project step requires them.

#### Step 6 — Verify Service Management Support

The presence of `systemctl` and `journalctl` does not establish that systemd is the active service manager.

Run:

```bash
ps -p 1 -o pid=,comm=,args=
```

Inspect the output to identify process ID 1. We will use this result to determine which service-management instructions apply to the current environment.

### 3.3 Environment-Specific Considerations

The initial implementation targets WSL2 rather than a dedicated Linux server.

- Some system services may not run by default.
- systemd availability depends on the WSL configuration and distribution setup.
- Service startup, boot behavior, and log availability may differ from a conventional server.
- Hardware and resource information reported by Linux may reflect the WSL virtualized environment.
- Commands requiring administrative privileges must be used carefully.

When a task depends on functionality unavailable in the current environment, document the limitation and choose an appropriate alternative or a separate Linux virtual machine if needed.

### 3.4 Safety, Security, and Cost Considerations

- Work within the dedicated project directory whenever possible.
- Read commands before executing them, especially commands that delete files or modify system configuration.
- Use `sudo` only when necessary and understand what the command changes.
- Do not store passwords, access tokens, private keys, or other secrets in the repository.
- Avoid exposing services to external networks as part of this initial lab.
- Prefer test files and dedicated lab accounts over changes to important personal files.
- Review cleanup commands before execution; do not remove system packages or files simply to make the lab appear clean.

The initial WSL2 lab is intended to run locally and does not require paid cloud resources.

## 4. Architecture and Design

### 4.1 Architecture Overview

The Linux Server Administration Lab is a local, single-machine learning environment. It uses Ubuntu 24.04.4 LTS running under WSL2 and systemd for service management.

The learner interacts with the environment through a Bash terminal. Administrative commands and scripts perform tasks against the local Linux environment. Validation commands inspect the resulting state, and the project documentation records the procedures and observed results.

The lab is designed to begin with safe, isolated practice tasks and progress toward repeatable administration and troubleshooting workflows.

### 4.2 Architecture Diagram

```text
+----------------------------------------------------+
|              Windows Host                          |
|                                                    |
|  +----------------------------------------------+  |
|  |          WSL2 Virtualized Environment        |  |
|  |                                              |  |
|  |  +----------------------------------------+  |  |
|  |  | Ubuntu 24.04.4 LTS                     |  |  |
|  |  |                                        |  |  |
|  |  |  Bash Terminal                         |  |  |
|  |  |       |                                |  |  |
|  |  |       v                                |  |  |
|  |  |  Linux Commands and Bash Scripts       |  |  |
|  |  |       |                                |  |  |
|  |  |       v                                |  |  |
|  |  |  Filesystem, Users, Processes,          |  |  |
|  |  |  Packages, Services, Logs, Resources   |  |  |
|  |  |       |                                |  |  |
|  |  |       v                                |  |  |
|  |  |  Verification and Test Procedures      |  |  |
|  |  +----------------------------------------+  |  |
|  |                                              |  |
|  +----------------------------------------------+  |
|                                                    |
+----------------------------------------------------+

Project artifacts are maintained in the devops-journey
Git repository and documented in the project directory.
```

### 4.3 Component Responsibilities

| Component | Responsibility |
|---|---|
| WSL2 | Provides the Linux environment hosted on Windows |
| Ubuntu | Supplies the Linux distribution and administration tools |
| Bash | Interprets commands and executes shell scripts |
| Linux command-line tools | Perform filesystem, process, package, and resource operations |
| systemd | Manages supported system services and units |
| journalctl | Reads available systemd journal records |
| Scripts | Automate selected repeatable administration tasks |
| Tests | Check expected behavior and help detect failures |
| Documentation and evidence | Record setup instructions, validation results, and lessons learned |
| Git | Tracks changes to the project files |

### 4.4 Design Decisions

**Use the existing WSL2 environment**

The initial implementation uses the existing Ubuntu environment to avoid unnecessary installation costs and setup complexity. It is suitable for practicing many Linux administration tasks, although some hardware, networking, boot, and service behavior differs from a dedicated Linux server.

**Use Bash for initial automation**

Bash is already available and is widely used for command-line operations and administration scripts. The project will begin with straightforward scripts before introducing more complex automation.

**Keep project files isolated**

Scripts, tests, and evidence will be stored under the dedicated project directory. This makes the lab easier to inspect, maintain, version-control, and clean up without mixing its files with the daily learning notes.

**Verify changes rather than assuming success**

Each important implementation step will include validation commands and expected results. Actual test outcomes will be recorded only after the tests have been performed.

**Use safe, incremental implementation**

The lab will prefer dedicated test files and controlled changes. Potentially destructive operations and unnecessary changes to system configuration will be avoided.

**Document environment-specific limitations**

Service management, logging, and other environment-dependent features will be tested when introduced. The guide will distinguish confirmed behavior from expected behavior that has not yet been verified.

## 5. Create the Project Structure

### 5.1 Project Root Directory

The project is maintained inside the `devops-journey` repository so its documentation, scripts, tests, and evidence can be version-controlled alongside the learning materials.

The project root directory is:

```text
Projects/Linux-Server-Administration-Lab/
```

Run the following command from the repository root to create the project directories:

```bash
mkdir -p Projects/Linux-Server-Administration-Lab/{scripts,tests,evidence}
```

The `-p` option creates missing parent directories and does not report an error when the requested directories already exist.

### 5.2 Expected Directory Structure

The initial structure is:

```text
Projects/
└── Linux-Server-Administration-Lab/
    ├── README.md
    ├── scripts/
    ├── tests/
    ├── evidence/       # sanitized evidence only
    └── local-output/   # ignored, machine-specific reports
```

### 5.3 Directory and File Responsibilities

| Path | Responsibility |
|---|---|
| `Projects/Linux-Server-Administration-Lab/README.md` | Main project guide, including setup, implementation, testing, and lessons learned |
| `Projects/Linux-Server-Administration-Lab/scripts/` | Bash scripts created during the project |
| `Projects/Linux-Server-Administration-Lab/tests/` | Repeatable test procedures and validation scripts |
| `Projects/Linux-Server-Administration-Lab/evidence/` | Sanitized, non-sensitive evidence suitable for review and potential publication |

The directories may initially be empty. Files will be added when they are needed for an implementation step.

### 5.4 Verify the Project Structure

From the repository root, run:

```bash
find Projects/Linux-Server-Administration-Lab -maxdepth 2 -print | sort
```

The output should list the project root, `README.md`, and the three supporting directories.

### 5.5 File Management Guidelines

- Keep project-specific files inside this directory.
- Use descriptive filenames, such as `check-disk-usage.sh`, when adding scripts.
- Explain the purpose of each script before introducing it.
- Add tests alongside the features they validate.
- Store only useful, non-sensitive evidence.
- Never save passwords, tokens, private keys, or other secrets in the project.
- Update this guide as implementation details are verified.

The structure is a starting point and may be extended when a genuine project requirement calls for additional files or directories.

## 6. Step-by-Step Implementation Guide

This section records the practical implementation of the Linux Server Administration Lab. Each stage introduces a specific administrative task, explains its relevance, provides commands, and defines how to verify the result.

**Implementation status:** Core inspection and automation implementation completed; final project completion remains in progress. Steps 1–10 have been implemented and validated through inspection scripts, automated tests, and saved evidence. End-to-end validation passed with 11 test suites and zero failures; the automation runner executed all nine inspection scripts with zero failures. Disposable temporary-file/directory cleanup and a disposable child-process cleanup test passed. Service cleanup has not been tested; final documentation and repository security review remain pending.

### Implementation Roadmap

| Step | Implementation area | Industry relevance | Status |
|---|---|---|---|
| 1 | Baseline system inspection | Establishes system health and environment details | Completed |
| 2 | Filesystem and directory administration | Organizes application and operational files | Completed |
| 3 | User and group administration | Manages accounts and access boundaries | Completed |
| 4 | File ownership and permissions | Applies least-privilege access | Completed |
| 5 | Process management | Investigates and manages running programs | Completed |
| 6 | Package management | Installs and maintains required tools | Completed |
| 7 | Service management | Inspects and manages supported system services | Completed |
| 8 | Logs and troubleshooting | Investigates operational failures | Completed |
| 9 | Disk and resource inspection | Identifies capacity and resource issues | Completed |
| 10 | Bash automation | Makes repeatable administrative tasks more efficient | Completed |
| 11 | End-to-end validation | Demonstrates that project requirements are satisfied | 11 test suites passed; disposable file and process cleanup tests passed; service cleanup and final review remain |

Statuses in this roadmap will be updated as implementation progresses. A command appearing in this guide is not evidence that the associated task has been completed.

### Step 1 — Baseline System Inspection

**Goal**

Collect an initial snapshot of the Linux environment before changing system configuration. This provides a reference for later troubleshooting and verification.

**Industry context**

System administrators and DevOps engineers often begin an investigation by identifying the operating system, kernel, uptime, storage capacity, and memory availability. These checks help establish the environment and provide useful context when diagnosing problems.

**Environment**

Run the commands from the Ubuntu terminal. The initial lab uses Ubuntu 24.04.4 LTS under WSL2.

**Implementation instructions**

Run each command separately and inspect its output.

1. Identify the operating system:

   ```bash
   cat /etc/os-release
   ```

   Review the distribution name and version.

2. Inspect the kernel and architecture:

   ```bash
   uname -a
   ```

   Review the kernel information and architecture reported by Linux.

3. Check system uptime:

   ```bash
   uptime
   ```

   Inspect how long the environment has been running and the reported load averages. In WSL2, these values describe the Linux environment and should not automatically be interpreted as measurements of the entire Windows host.

4. Inspect filesystem capacity:

   ```bash
   df -h
   ```

   Review mounted filesystems, their sizes, used space, available space, and utilization percentages. WSL2 storage reporting may differ from that of a dedicated Linux server.

5. Inspect memory information:

   ```bash
   free -h
   ```

   Review total, used, and available memory as reported to Linux.

**Validation commands**

Run the five commands above and confirm that each produces output without an execution error. If a command fails, record the exact error and investigate it before continuing.

**Expected result**

The learner should be able to identify the Linux distribution and kernel, inspect uptime, and interpret basic filesystem and memory information.

The exact output depends on the current environment and may change between runs. No fixed storage, uptime, or memory values are required for this initial check.

**Evidence to record**

Record the date of the check, the commands executed, and a concise summary of the observed results. Include selected output in the project evidence only when useful, and remove any sensitive information before saving it.

**Troubleshooting**

| Problem | Investigation | Response |
|---|---|---|
| A command is not found | Run `command -v COMMAND` with the affected command name | Confirm the command name and whether the required package is installed |
| Filesystem output is confusing | Review the mount points shown by `df -h` | Identify the filesystem relevant to the lab instead of assuming every listed mount is a separate physical disk |
| Memory figures differ from Windows | Compare the environment being measured and the reported values | Remember that WSL2 reports Linux-visible resource information |
| A command returns an error | Read the complete error message and repeat the command only if safe | Record the observed error and the verified resolution |

**Completion criteria**

- [ ] All five baseline commands have been executed.
- [ ] Their outputs have been reviewed.
- [ ] Any errors have been investigated or documented.
- [ ] A concise baseline record has been saved.
- [ ] The implementation status has been updated based on actual results.

Do not mark Step 1 as complete until these criteria have been met.

## 7. Integration and Configuration

### 7.1 How the Components Work Together

The lab combines Linux command-line tools, Bash scripts, validation procedures, and project documentation.

The intended workflow is:

1. Inspect the Linux environment.
2. Prepare dedicated lab files and test data.
3. Perform administration tasks using Linux commands.
4. Automate selected repeatable tasks with Bash scripts.
5. Validate results using commands and tests.
6. Record findings, errors, and solutions.
7. Clean up temporary lab resources.

### 7.2 Project Components

| Component | Integration responsibility |
|---|---|
| Ubuntu under WSL2 | Provides the Linux environment |
| Linux commands | Perform administration and inspection tasks |
| Bash scripts | Automate selected repeatable operations |
| `scripts/` | Stores project scripts |
| `tests/` | Stores test procedures and validation scripts |
| `evidence/` | Stores selected test results and observations |
| `README.md` | Documents setup, execution, troubleshooting, and project outcomes |
| Git | Tracks project changes |

### 7.3 Configuration Principles

- Use the existing Ubuntu environment unless a task requires additional software.
- Prefer dedicated lab directories and test files over important personal files.
- Use absolute paths in scripts where doing so improves reliability.
- Quote shell variables to handle spaces and special characters safely.
- Check command exit statuses when a script depends on successful execution.
- Avoid hardcoding passwords, access tokens, or other secrets.
- Use `sudo` only when an operation requires administrative privileges.
- Document environment-specific behavior instead of assuming all Linux systems are identical.

The initial implementation will not require a database, external API, paid cloud account, or application deployment.

## 8. Run the Project

### 8.1 Open the Project Directory

From the `devops-journey` repository root, run:

```bash
cd Projects/Linux-Server-Administration-Lab
```

Confirm the location:

```bash
pwd
```

The resulting path should end with:

```text
devops-journey/Projects/Linux-Server-Administration-Lab
```

### 8.2 Inspect the Project Files

Run:

```bash
find . -maxdepth 2 -type f -print | sort
```

This displays the project files currently present. Additional scripts and tests will appear as implementation progresses.

### 8.3 Execute Administrative Tasks

The initial workflow is to follow the implementation stages in Section 6 in order.

Before executing a task:

1. Read its objective and implementation instructions.
2. Inspect any files the task will modify.
3. Review commands that use elevated privileges or change system configuration.
4. Execute the commands in the stated order.
5. Run the validation checks.
6. Record the actual result.

### 8.4 Execute Bash Scripts

When a project script has been implemented, inspect it before execution.

```bash
# Replace check-example.sh with the actual script filename.
bash -n scripts/check-example.sh
```

This checks Bash syntax without running the script. It does not prove that the script behaves correctly. The filename `check-example.sh` is illustrative; use a script that actually exists in the project.

Execute the script using its documented command. For example:

```bash
bash scripts/check-example.sh
```

Run this command only after the script exists and you have reviewed its purpose, permissions, and potential effects. Do not copy and run the example literally unless that file exists.

### 8.5 Stop and Restart Operations

Use the stop, restart, or cleanup procedure documented for the specific task. Do not assume every script or service has the same lifecycle.

System services must be checked individually before management commands are used.

**Current status:** The baseline inspection and inspection-script workflow have been implemented and validated. The automated test runner completed 11 test suites with zero failures, and all nine inspection scripts ran without reported failures. Disposable temporary-file/directory cleanup and child-process cleanup were tested successfully. Service cleanup remains untested, and final documentation and repository security review are still pending.

## 9. Testing and Validation

### 9.1 Testing Strategy

Testing will be performed incrementally. Each feature must have a validation procedure before it is treated as implemented.

The test plan records the implemented checks and observed results. The current validation run completed successfully. Disposable file and child-process cleanup tests passed; service cleanup remains unverified.

### 9.2 Test Plan

| Test | Procedure / Command | Expected Result | Actual Result / Evidence |
|---|---|---|---|
| Environment identification | `cat /etc/os-release` | Distribution and version are displayed | Verified; see `evidence/baseline-inspection.md` |
| Kernel identification | `uname -a` | Kernel and architecture are displayed | Verified; see baseline evidence |
| Uptime inspection | `uptime` | Uptime and load averages are displayed | Verified; see baseline evidence |
| Filesystem inspection | `df -h` | Filesystem capacity and usage are displayed | Verified; see baseline evidence |
| Memory inspection | `free -h` | Memory and swap statistics are displayed | Verified; see baseline evidence |
| Directory administration | Inspect the lab directory and verify its contents | Inspection script and test passed; raw report is local-only |
| User and group administration | Inspect current account, group, and selected system-group information | Inspection script and test passed; raw report is local-only; no account changes made |
| Permissions | Inspect ownership and permissions of the lab demo file | Inspection test passed; mode 640 and ownership reported |
| Process management | Inspect process information and process-state reference | Inspection script and test passed; raw report is local-only |
| Package management | Inspect APT and installed package information | Inspection script and test passed; no packages changed |
| Service management | Inspect system manager and selected service details | Inspection script and test passed; no service states changed |
| Log inspection | Query available journal entries and log directory | Inspection script and test passed; raw report is local-only |
| Resource checks | Inspect disk, filesystem, memory, swap, and load information | Inspection script and test passed; raw report is local-only |
| Bash automation | Run all inspection scripts and the consolidated test runner | Nine scripts passed; 11 test suites passed; zero failures |
| Cleanup | Review and safely test the documented cleanup procedure | Disposable temporary-file and child-process cleanup tests passed; service cleanup not tested |

### 9.3 Validation Principles

- Verify command results rather than assuming success.
- Distinguish syntax checks from functional tests.
- Test both normal and relevant failure conditions.
- Record errors before applying a fix.
- Retest after a fix to establish whether it worked.
- Avoid destructive test cases on important system resources.
- Mark tests as passed only after execution.

### 9.4 Evidence Format

For each significant test, record:

- Test name and purpose.
- Command or procedure used.
- Expected result.
- Actual result.
- Pass, fail, or blocked status.
- Relevant error details or evidence file.
- Any limitations affecting interpretation.

## 10. Troubleshooting Guide

This section provides initial diagnostic guidance. The listed causes are possibilities to investigate, not claims that each issue has occurred in this lab.

| Symptom / Error | How to Investigate | Possible Cause | Response |
|---|---|---|---|
| Command not found | Run `command -v COMMAND` | Tool is missing or not in `PATH` | Confirm the command name and required package |
| Permission denied | Inspect `ls -l FILE` and run `id` | Insufficient permissions or incorrect ownership | Understand the required access before changing permissions |
| Script will not execute | Run `bash -n SCRIPT` and inspect the file | Syntax error or incorrect invocation | Correct the error and rerun the syntax check |
| Script has an unexpected result | Review its inputs, output, and exit status | Logic error or unexpected environment state | Reproduce the problem and test a focused fix |
| Package installation fails | Review the complete APT error output | Repository, network, package, or permission problem | Investigate the specific error before retrying |
| Service is unavailable | Run `systemctl status SERVICE` for a known unit | Service is absent, stopped, failed, or unavailable | Check the unit name and service logs |
| Journal query returns no useful entries | Inspect journal access and available units | No matching entries or limited journal availability | Adjust the query and verify that relevant logs exist |
| Disk usage appears to be 100% | Run `df -h` and inspect the mount point | Fixed-size image or separate mounted filesystem | Determine which filesystem is actually relevant |
| Memory readings differ from Windows | Run `free -h` and identify the measured environment | Linux and Windows report resources at different layers | Interpret the output as Linux-visible memory information |
| Cleanup command targets the wrong location | Run `pwd` and inspect the target path | Incorrect working directory or path | Stop and correct the target before proceeding |

### 10.1 Troubleshooting Procedure

1. Capture the exact command and error message.
2. Identify the affected file, process, package, service, or filesystem.
3. Inspect the relevant state using read-only diagnostic commands first.
4. Form a specific hypothesis about the cause.
5. Apply the smallest safe corrective action.
6. Repeat the original test.
7. Document the verified outcome.

Do not use broad permission changes, forced process termination, or destructive cleanup as a first response.

## 11. Acceptance Criteria

The project will be considered complete only after the applicable implementation and verification requirements have been met.

### 11.1 Documentation Criteria

- [x] Project purpose and objectives are documented.
- [x] Required skills and technologies are identified.
- [x] Industry job-role relevance is explained.
- [x] The initial environment has been inspected.
- [x] The project directory structure has been created.
- [x] Baseline system inspection script is implemented and runs successfully.
- [x] Automated tests verify eight expected report headings and messages.
- [x] System inspection output is saved in the evidence directory.

### 11.2 Implementation Criteria

- [x] Filesystem and directory inspection script is implemented, executed, and verified by automated tests.
- [x] User and group inspection script and automated test are implemented and verified.
- [x] Ownership and permissions inspection script and automated test are implemented and verified.
- [x] Process inspection script and automated test are implemented and verified.
- [x] Package inspection script and automated test are implemented and verified without changing installed packages.
- [x] Service inspection script and automated test are implemented and verified without changing service states.
- [x] Log inspection procedures are implemented and tested.
- [x] Disk and resource inspection tasks are implemented and validated.
- [x] Bash automation runner and direct runner test are implemented and tested.
- [x] End-to-end validation passed: 11 test suites, zero failures.
- [ ] Cleanup instructions are reviewed and safely tested.
- [ ] Known limitations and unresolved issues are documented in the final review.

### 11.3 Final Completion Rule

Documentation preparation alone does not satisfy implementation criteria. Each required feature must have supporting test results or other appropriate evidence before it is marked complete.

The project status in `PROJECTS.md` and any relevant learning tracker will be updated after the implementation and evidence have been reviewed.

## 12. Cleanup and Resource Removal

### 12.1 Cleanup Principles

Cleanup should remove only resources created for this lab. It must not damage the repository, personal files, system packages, or unrelated services.

Before removing any resource:

1. Identify its exact path or resource name.
2. Confirm that it was created for the lab.
3. Check whether another task depends on it.
4. Review the removal command.
5. Verify the result after cleanup.

### 12.2 Remove Temporary Lab Files

For temporary files created during a specific exercise, inspect the dedicated lab test directory first:

```bash
mkdir -p /tmp/linux-admin-lab-test
find /tmp/linux-admin-lab-test -maxdepth 2 -print
```

This is an example directory for disposable test data. Use it only for lab files you created and verified. Inspect the directory contents before cleanup.

Remove only verified test files using a targeted command appropriate to that exercise. Never use broad deletion commands or remove files outside the lab's dedicated test directory.

### 12.3 Stop Test Processes

Identify the test process before stopping it:

```bash
ps -ef
```

Use the documented process identifier and a suitable signal for the test process. Avoid terminating unrelated processes.

### 12.4 Service Cleanup

If a future exercise creates or changes a service, document how to restore the original state. Do not disable or remove system services merely because they are not needed by the lab.

### 12.5 Repository Cleanup

Review pending changes from the repository root:

```bash
git status --short
```

Do not delete the project guide or evidence as part of routine lab cleanup. These files are intended to remain in the repository.

### 12.6 Cleanup Verification

- [x] Disposable test resources and exact paths were identified.
- [x] The exact cleanup targets were reviewed before removal.
- [x] Only the disposable test file and its empty temporary directory were removed.
- [x] No project files or services were targeted by this disposable test.
- [x] Disposable child-process cleanup was exercised and verified.
- [ ] Service cleanup has not been exercised.
- [x] Project documentation and intended deliverables remain present.

Cleanup commands must be tailored to the resources actually created. A general-purpose destructive command is not part of this project's default cleanup procedure.

## 13. Challenges and Solutions

This section will record problems encountered during actual implementation.

Each entry should include:

- **Problem:** What failed or behaved unexpectedly.
- **Impact:** Which task was affected.
- **Investigation:** Commands and observations used to diagnose it.
- **Cause:** The confirmed cause, if identified.
- **Solution:** The corrective action taken.
- **Verification:** Evidence that the solution worked.
- **Prevention:** How to avoid or detect the issue in future.

### Initial Environment Observation

During baseline inspection, several mounted filesystems reported 100% utilization while the root filesystem had substantial available space.

The relevant diagnostic command was:

```bash
df -h
```

The observation demonstrates why filesystem utilization must be interpreted together with the mount point. It does not indicate that the root filesystem was full.

Further implementation challenges will be added after they occur. Planned examples are not recorded as completed troubleshooting incidents.

## 14. Lessons Learned

This section will capture the practical knowledge gained during implementation.

Topics to reflect on include:

- Interpreting Linux system and resource information.
- Understanding filesystem paths and mount points.
- Applying least-privilege access.
- Inspecting and managing processes.
- Understanding package and service management.
- Investigating logs and command failures.
- Writing safe and repeatable Bash scripts.
- Validating changes and recording evidence.
- Understanding differences between WSL2 and a dedicated Linux server.

At the end of implementation, distinguish concepts demonstrated through practical tests from those that still require further practice.

## 15. Evidence and Deliverables

### 15.1 Planned Deliverables

| Deliverable | Location | Status |
|---|---|---|
| Main project guide | `README.md` | Existing guide updated in this documentation pass; final review still required |
| Baseline environment record | `evidence/baseline-inspection.md` | Created and present |
| System inspection script and test | `scripts/system-inspection.sh`; `tests/test-system-inspection.sh` | Implemented; automated test passed |
| System inspection report | `local-output/` (generated reports) | Generated locally; not intended for publication |
| Filesystem inspection script and test | `scripts/filesystem-inspection.sh`; `tests/test-filesystem-inspection.sh` | Implemented; automated test passed |
| User and group inspection script and test | `scripts/user-group-inspection.sh`; `tests/test-user-group-inspection.sh` | Implemented; automated test passed |
| Permissions inspection script and test | `scripts/permissions-inspection.sh`; `tests/test-permissions-inspection.sh` | Implemented; automated test passed |
| Process inspection script and test | `scripts/process-inspection.sh`; `tests/test-process-inspection.sh` | Implemented; automated test passed |
| Package inspection script and test | `scripts/package-inspection.sh`; `tests/test-package-inspection.sh` | Implemented; automated test passed |
| Service inspection script and test | `scripts/service-inspection.sh`; `tests/test-service-inspection.sh` | Implemented; automated test passed |
| Logs inspection script and test | `scripts/logs-inspection.sh`; `tests/test-logs-inspection.sh` | Implemented; automated test passed |
| Resource inspection script and test | `scripts/resource-inspection.sh`; `tests/test-resource-inspection.sh` | Implemented; automated test passed |
| Automation runner and test | `scripts/lab-runner.sh`; `tests/test-lab-runner.sh` | Implemented; runner test passed |
| Consolidated test runner | `tests/run-all-tests.sh` | 11 test suites passed; zero failures |
| Automation run report | `local-output/automation-run-report.txt` | Nine scripts ran; zero failures; local-only output |
| Sanitized evidence | `evidence/` | Baseline inspection procedure documented; review any additional evidence before publication |
| Lab working directory and permissions demo | `lab-data/` | Created; demo file permissions inspected |
| Process cleanup test | `tests/test-process-cleanup.sh` | Disposable child process terminated and reaped; test passed |
| Cleanup procedure validation | Section 12 and related resources | File and process cleanup tested; service cleanup and final review remain pending |

### 15.2 Evidence Requirements

Evidence should support the claims made in the guide. Appropriate evidence may include:

- Selected command output.
- Test results and validation records.
- Script syntax-check results.
- Before-and-after observations for controlled exercises.
- Troubleshooting records.
- Architecture diagrams and useful screenshots.

Avoid saving excessive terminal output when a concise record is sufficient.

Never include passwords, access tokens, private keys, or other secrets in evidence or source control. Raw inspection output may also expose usernames, hostnames, home-directory paths, group memberships, process IDs, logs, installed software, and system configuration. Keep raw reports in the ignored `local-output/` directory and publish only evidence that has been reviewed and sanitized. Ignore rules are a safeguard, not a guarantee: inspect the complete proposed file list before staging or uploading.

## 16. Future Improvements

After the core lab is implemented and verified, potential extensions include:

- More robust Bash scripts with argument validation and error handling.
- Automated test execution for selected administration tasks.
- Structured log collection and reporting.
- Network diagnostics and connectivity troubleshooting.
- Configuration management using Ansible.
- Container administration with Docker.
- System monitoring using Prometheus and Grafana.
- Practice in a dedicated Linux virtual machine to explore behavior beyond WSL2.
- CI workflows to validate shell scripts and documentation.

These are optional extensions. They should not be treated as required functionality for the initial version.

## 17. References

Use official documentation as the primary source for commands, configuration, and environment-specific behavior.

- Ubuntu documentation: https://help.ubuntu.com/
- Ubuntu Server documentation: https://documentation.ubuntu.com/server/
- Ubuntu package management: https://documentation.ubuntu.com/server/how-to/software/package-management/
- Microsoft WSL documentation: https://learn.microsoft.com/windows/wsl/
- Bash Reference Manual: https://www.gnu.org/software/bash/manual/
- GNU Coreutils manual: https://www.gnu.org/software/coreutils/manual/
- systemd documentation: https://www.freedesktop.org/software/systemd/man/
- Git documentation: https://git-scm.com/doc

Command behavior may vary by distribution, version, privileges, and environment. Verify important operations against the documentation applicable to the installed system.

## 18. Final Review

Before declaring the project complete, review the following checklist.

### Documentation

- [ ] All 18 sections have been reviewed.
- [ ] Project objectives, skills, use cases, and job-role relevance are explained.
- [ ] File paths and commands match the final project structure.
- [ ] Instructions are understandable to a beginner.
- [ ] Expected outputs are distinguished from actual observed outputs.
- [ ] References and environment-specific limitations are documented.

### Implementation and Testing

- [x] Inspection and automation stages 1–10 have been implemented.
- [x] Shell scripts pass syntax checks and the 11-suite functional test run.
- [x] Implemented inspection tasks have been validated.
- [x] Test results show 11 suites passed and zero failed.
- [ ] Troubleshooting limitations and unresolved issues have been reviewed for the final documentation.
- [x] Cleanup guidance was reviewed; disposable temporary-file and child-process cleanup tests passed. Service cleanup remains untested.

### Evidence and Repository

- [x] Sanitized baseline evidence is present; detailed inspection and automation reports are generated locally and excluded from publication.
- [ ] Project files and evidence have received a final secret/sensitive-data review.
- [x] README roadmap and test status reflect the verified implementation.
- [ ] `PROJECTS.md` and the relevant learning tracker have been checked for consistency.
- [ ] All repository changes have been reviewed after this documentation update.
- [ ] Git synchronization follows the DLOS batch workflow; no commit or push has been performed.

The project is complete only when its applicable acceptance criteria have been met and supported by evidence. A finished guide is an important deliverable, but it is not a substitute for implementing and testing the lab.
