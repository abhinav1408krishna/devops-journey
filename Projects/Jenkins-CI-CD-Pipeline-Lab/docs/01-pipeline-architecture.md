
# Jenkins CI/CD Pipeline Architecture

## 1. Overview

This project uses a Jenkins Declarative Pipeline to automate validation and testing of the Linux Server Administration Lab.

The pipeline definition is stored in the GitHub repository as a Jenkinsfile.

Jenkins retrieves the Jenkinsfile from the main branch and executes the pipeline on the dedicated Linux agent.

## 2. Components

| Component | Responsibility |
|---|---|
| GitHub | Stores source code and Jenkinsfile |
| Jenkins Controller | Schedules and monitors pipeline execution |
| Jenkins Pipeline Job | Loads and executes the Jenkinsfile |
| linux-agent-02 | Executes pipeline shell steps |
| Linux Administration Lab | Provides scripts and automated tests |
| Jenkins Artifacts | Stores build and test reports |

## 3. Execution Flow

1. Jenkins retrieves the repository from GitHub.
2. Jenkins loads the configured Jenkinsfile.
3. The pipeline is assigned to the node with label `linux-agent`.
4. The Checkout stage confirms repository and build information.
5. The Validate Project stage checks required files and directories.
6. The Build stage creates build metadata.
7. The Test stage runs all available Linux lab test suites.
8. The post section archives available reports.
9. Jenkins records the final pipeline result.
10. The workspace is cleaned.

## 4. Execution Identity

Pipeline shell steps execute under the dedicated Linux account:

`jenkins-agent`

The controller coordinates the pipeline, while the agent performs the shell commands.

## 5. Artifact Flow

The pipeline creates the following files:

- `pipeline-reports/build-info.txt`
- `pipeline-reports/test-report.txt`

Jenkins archives matching text reports and fingerprints them for traceability.

## 6. Failure Handling

The test command uses Bash `pipefail` so that a failure in the test runner is propagated through the `tee` pipeline.

A failed test therefore produces a failed Jenkins stage rather than being hidden by successful report output.

The post section records success or failure and archives reports that were generated.

## 7. Workspace Management

The `cleanWs()` post-build action removes the workspace after pipeline execution.

Reports must therefore be archived before cleanup.

## 8. Scope and Limitations

This project demonstrates continuous integration through automated checkout, validation, testing, and artifact archiving.

It does not yet implement Docker image creation, container registry publication, or application deployment.

Those capabilities are reserved for later learning projects.
