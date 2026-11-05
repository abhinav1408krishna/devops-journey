
# Jenkins Build, Test and Artifact Management

## 1. Build Preparation

The pipeline validates the Linux Server Administration Lab directory structure before preparing build metadata.

The Build stage creates:

`pipeline-reports/build-info.txt`

The report records:

- Jenkins build number
- Git commit revision
- Linux execution identity
- UTC build date

## 2. Automated Test Execution

The pipeline runs the existing test runner:

`Projects/Linux-Server-Administration-Lab/tests/run-all-tests.sh`

The runner automatically discovers test scripts matching:

`tests/test-*.sh`

It executes each test suite and records the number of passed and failed suites.

## 3. Test Coverage

The existing Linux Administration Lab contains 11 test suites covering:

- Filesystem inspection
- Lab runner behavior
- Logs inspection
- Package inspection
- Permissions inspection
- Process cleanup
- Process inspection
- Resource inspection
- Service inspection
- System inspection
- User and group inspection

## 4. Test Report

The pipeline writes console output to:

`pipeline-reports/test-report.txt`

The `tee` command displays output in Jenkins while saving a copy for archiving.

Bash `pipefail` ensures that a failing test runner causes the pipeline command to return a failure status.

## 5. Artifact Archiving

Jenkins archives:

`pipeline-reports/*.txt`

The archived files include build metadata and the test report when those files were successfully generated.

Artifact fingerprinting is enabled for traceability.

The archive operation is placed in the `always` post condition so reports generated before a failure can still be retained.

## 6. Failure Scenario

An intentional test failure will be used to verify that:

1. The Test stage fails.
2. Jenkins marks the pipeline as failed.
3. The failure post condition executes.
4. Available reports are archived.
5. Workspace cleanup runs afterward.

The failure test must not permanently modify the original Linux Administration Lab tests.

## 7. Successful Build Verification

A successful pipeline run should demonstrate:

- Source checkout completed.
- Required project structure validated.
- Build metadata generated.
- All 11 test suites passed.
- Reports archived successfully.
- Pipeline result marked successful.
- Workspace cleaned.

## 8. Artifact Retention

The pipeline retains a maximum of 10 builds and up to 10 builds' worth of archived artifacts through its build discarder configuration.

Jenkins manages the archived artifacts independently of the cleaned workspace.

## 9. Limitations

This project currently demonstrates continuous integration and artifact management.

Container image construction, registry publication, automated deployment, and rollback are outside its current scope.
