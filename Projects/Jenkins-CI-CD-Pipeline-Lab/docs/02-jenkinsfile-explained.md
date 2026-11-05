
# Jenkinsfile Explained

## 1. What Is a Jenkinsfile?

A Jenkinsfile is a text file that defines a Jenkins Pipeline.

Keeping the pipeline in GitHub allows pipeline changes to be reviewed, version-controlled, and maintained alongside the project.

This project uses Declarative Pipeline syntax.

## 2. Pipeline Declaration

The `pipeline` block defines the complete pipeline.

Declarative Pipeline provides a structured syntax for defining agents, options, environment variables, stages, and post-build actions.

## 3. Agent

The pipeline uses:

`agent { label 'linux-agent' }`

Jenkins schedules the pipeline on an available node matching this label.

The lab uses the inbound agent `linux-agent-02`.

## 4. Pipeline Options

The pipeline configures:

- `timestamps()` — adds timestamps to console output.
- `disableConcurrentBuilds()` — prevents overlapping executions of this job.
- `buildDiscarder()` — limits retained builds and archived artifacts.

## 5. Environment Variables

The environment block defines:

- `LINUX_LAB` — path to the Linux Server Administration Lab.
- `REPORT_DIR` — directory used for pipeline reports.

These values are available to the pipeline's shell steps.

## 6. Stages

### Checkout

The Pipeline job uses Pipeline script from SCM.

Jenkins checks out the configured GitHub repository and loads the Jenkinsfile. The Checkout stage then displays workspace, build number, and Git revision information.

### Validate Project

The stage checks that required directories and the test runner exist.

It stops execution if required project files are missing.

### Build

The Build stage creates the report directory and writes build metadata.

The metadata includes build number, Git revision, execution identity, and UTC date.

### Test

The Test stage executes:

`bash "$LINUX_LAB/tests/run-all-tests.sh"`

The command uses `pipefail` and `tee` to preserve test output while writing a report.

A failing test must cause the shell step and pipeline stage to fail.

## 7. Post Section

The post section handles actions after pipeline execution.

- `always` — archives available reports and records completion.
- `success` — records successful pipeline completion.
- `failure` — reports that pipeline execution failed.
- `cleanup` — removes the workspace after other post actions.

## 8. Artifact Archiving

The pipeline archives:

`pipeline-reports/*.txt`

Fingerprinting enables Jenkins to track archived files.

The archive operation runs in the `always` post condition so reports can be retained even when a previous stage fails.

## 9. Workspace Cleanup

The `cleanWs()` action removes the job workspace after artifact archiving.

This helps prevent stale workspace files from affecting later builds.

## 10. Key Learning Outcomes

- Declarative Pipeline structure.
- Pipeline agent selection.
- Environment variable usage.
- Stage sequencing.
- Shell failure propagation.
- Test report generation.
- Artifact archiving and fingerprinting.
- Post-build execution and workspace cleanup.
