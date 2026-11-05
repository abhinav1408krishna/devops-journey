
# Jenkins CI/CD Pipeline Automation Lab

## Project Overview

An independently developed Jenkins Declarative Pipeline project demonstrating automated source checkout, project validation, build preparation, test execution, artifact archiving, and post-build handling.

This project extends the Jenkins Fundamentals & Administration Lab by implementing a version-controlled Jenkinsfile and an end-to-end CI pipeline.

## Environment

| Component | Implementation |
|---|---|
| Operating system | Ubuntu 24.04 on WSL2 |
| CI server | Jenkins LTS 2.580.2 |
| Java | OpenJDK 21 |
| Source control | Git and GitHub |
| Pipeline type | Declarative Pipeline |
| Execution node | linux-agent-02 |
| Agent label | linux-agent |
| Agent identity | jenkins-agent |
| Test project | Linux Server Administration Lab |

## Pipeline Stages

1. Checkout — Jenkins retrieves the repository from GitHub.
2. Validate Project — checks required project directories and test runner.
3. Build — prepares the pipeline report directory and build information.
4. Test — executes the Linux Server Administration Lab test suites.
5. Post-build — archives available reports and records pipeline status.

## Pipeline Features

- Jenkinsfile stored in source control.
- Declarative Pipeline syntax.
- Dedicated Linux agent execution.
- Build timestamps.
- Concurrent build prevention.
- Build and artifact retention.
- Test output captured in a report.
- Shell pipeline failure propagation using `pipefail`.
- Artifact fingerprinting.
- Post-build success and failure handling.
- Workspace cleanup.

## Project Structure

- `Jenkinsfile` — Declarative Pipeline definition.
- `README.md` — project overview and implementation checklist.
- `docs/` — architecture, Jenkinsfile explanation, and execution documentation.

## Implementation Checklist

- [x] Project directory created.
- [x] Initial Declarative Jenkinsfile created.
- [x] GitHub Pipeline job configuration inspected.
- [x] Dedicated Linux agent selected.
- [x] Test failure propagation configured.
- [ ] Jenkinsfile committed and published.
- [ ] First successful pipeline execution.
- [ ] All 11 test suites verified through Pipeline.
- [ ] Build artifacts archived and verified.
- [ ] Intentional test failure verified.
- [ ] Final documentation and security review.

## Project Status

Pipeline implementation is in progress.

The first end-to-end Jenkins execution and artifact verification remain pending.

This is an independently developed learning and portfolio project, not a representation of production infrastructure or employment experience.
