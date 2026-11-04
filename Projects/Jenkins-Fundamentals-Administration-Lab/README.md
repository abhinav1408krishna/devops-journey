# Jenkins Fundamentals & Administration Lab

## Project Overview

An independently developed, hands-on Jenkins administration and CI
learning project using Jenkins LTS on Ubuntu 24.04 under WSL2.

The lab demonstrates Jenkins installation, controller configuration,
Freestyle job execution, build management, GitHub integration,
SCM polling, credentials binding, inbound agent execution,
backup creation, and operational verification.

The goal is to understand not only how to configure Jenkins, but also
how jobs execute, how components communicate, how failures propagate,
and how build outputs and administrative data are managed.

## Environment

| Component | Implementation |
|---|---|
| Operating system | Ubuntu 24.04 on WSL2 |
| Init system | systemd |
| Java | OpenJDK 21 |
| CI server | Jenkins LTS |
| Jenkins home | `/var/lib/jenkins` |
| Jenkins port | `8080` |
| Jenkins service account | `jenkins` |
| Agent account | `jenkins-agent` |
| Agent name | `linux-agent-02` |
| Agent label | `linux-agent` |
| Agent launch | Inbound WebSocket |
| Source repository | `abhinav1408krishna/devops-journey` |

## Project Modules

1. Jenkins installation and environment setup
2. Initial configuration and plugin management
3. Jenkins architecture and internal working
4. Freestyle jobs and build execution
5. Build management and failure handling
6. Git and GitHub integration
7. Build triggers and automation
8. Credentials and security
9. Agents and distributed execution
10. Administration, backup and troubleshooting
11. Testing and final validation

## Implementation Checklist

- [x] Jenkins installed and running as a systemd service
- [x] Java 21 configured and verified
- [x] Initial setup and administrator account configured
- [x] Required plugins installed
- [x] Controller and built-in node inspected
- [x] Freestyle job created and executed
- [x] Successful and intentional failed builds tested
- [x] Multiple shell build steps and workspace communication tested
- [x] Build retention configured and verified
- [x] Workspace cleanup configured and verified
- [x] Build artifacts generated and archived
- [x] Parameterized builds tested, including invalid input
- [x] Scheduled build trigger tested
- [x] GitHub repository checkout integrated and verified
- [x] GitHub SCM polling detected a repository change
- [x] Automated Linux lab test suite executed through Jenkins
- [x] Credentials binding and console masking tested with a dummy secret
- [x] Inbound Linux agent configured and connected
- [x] Build executed remotely as `jenkins-agent`
- [x] Jenkins service restart and agent reconnection verified
- [x] Jenkins home backup created and archive exclusions verified
- [x] Final security review and publication review
- [ ] Optional GitHub webhook configuration (not required for verified polling)

## Documentation

- `docs/01-architecture-and-execution.md` — architecture and execution flow
- `docs/02-installation-and-configuration.md` — installation and service setup
- `docs/03-jobs-github-and-build-management.md` — jobs, GitHub, triggers and artifacts
- `docs/04-security-agents-backup-and-troubleshooting.md` — credentials, agents, backup and operations

## Project Structure

- `README.md` — project overview, environment and implementation checklist
- `docs/` — architecture, installation, jobs, security, agents, backup and troubleshooting documentation

## Project Status

Implementation exercises, documentation, and initial publication security review completed.

SCM polling was verified successfully. Optional GitHub webhook configuration was not performed.

This is an independently developed learning and portfolio project.
It is not a representation of production infrastructure or employment experience.
