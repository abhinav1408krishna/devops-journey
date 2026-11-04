
# Jenkins Security, Agents, Backup and Troubleshooting

## 1. Purpose

This document explains the security, agent execution, backup, and recovery exercises performed in the Jenkins Fundamentals and Administration Lab.

The exercises demonstrate:

- Jenkins credentials management.
- Secret injection into build environments.
- Console output masking.
- Inbound agent configuration.
- Remote build execution.
- Jenkins controller backup.
- Backup exclusions and verification.
- Service restart and agent reconnection.
- Operational troubleshooting and security considerations.

## 2. Jenkins Credentials Management

Jenkins provides a credentials store for managing sensitive information used by jobs and integrations.

Credentials should be stored in Jenkins rather than written directly into build scripts or repository files.

### Credentials Exercise

A disposable Secret Text credential was created for this exercise.

| Setting | Configuration |
|---|---|
| Credential type | Secret Text |
| Credential ID | `lab-demo-secret` |
| Scope | Global |
| Description | Disposable secret for credentials binding exercise |

The credential was used only to demonstrate Jenkins credential binding.

It was not used as an actual GitHub account password or production credential.

### Credentials Binding

The Freestyle job `03-credentials-security-demo` was configured to expose the stored credential through an environment variable.

| Setting | Value |
|---|---|
| Build Environment | Use secret text(s) or file(s) |
| Credential | `lab-demo-secret` |
| Variable name | `DEMO_SECRET` |

Jenkins injected the credential into the build environment when the job executed.

### Verification Script

The following check verified that the environment variable was available without displaying its value:

```bash
#!/bin/bash
set -e

if [[ -n "${DEMO_SECRET:-}" ]]; then
    echo "PASS: Secret credential is available."
else
    echo "FAIL: Secret credential is missing."
    exit 1
fi
```

The build completed successfully.

### Console Masking Exercise

A separate exercise intentionally echoed the disposable demonstration secret.

Jenkins masked the matching value in the console output, displaying:

`****`

This demonstrated Jenkins console masking behavior.

Masking is a protective measure, not a guarantee that secrets cannot leak.

Build scripts should never print real credentials. Environment variables may also be accessible to other processes running with sufficient permissions.


## 3. Jenkins Agent Configuration

Jenkins uses agents to execute build workloads outside the controller's own execution environment.

The controller coordinates jobs, while agents provide execution capacity.

This lab configured a dedicated inbound agent named `linux-agent-02`.

### Agent Configuration

| Setting | Value |
|---|---|
| Node name | `linux-agent-02` |
| Node type | Permanent Agent |
| Executors | 1 |
| Remote root directory | `/home/jenkins-agent` |
| Labels | `linux-agent` |
| Usage | Only build jobs with matching label expressions |
| Launch method | Launch agent by connecting it to the controller |
| Connection | WebSocket |

The agent ran under a dedicated Linux account named `jenkins-agent`.

### Linux Account and Workspace

A dedicated account was created:

```bash
sudo adduser --disabled-password --gecos "" jenkins-agent
```

The agent working directory was:

`/home/jenkins-agent`

Its permissions were configured as:

`750`

The directory was owned by:

`jenkins-agent:jenkins-agent`

This restricted access to the agent account and authorized group members.

### Agent Connection

The Jenkins agent JAR was downloaded from the controller:

`http://localhost:8080/jnlpJars/agent.jar`

The agent connected to the controller using WebSocket communication.

The connection secret was stored locally in a protected file rather than written directly into the command.

The agent process was started with the following command:

```bash
java -jar agent.jar \
  -url http://localhost:8080/ \
  -secret @secret-file \
  -name "linux-agent-02" \
  -webSocket \
  -workDir "/home/jenkins-agent"
```

The command was executed as the `jenkins-agent` Linux account.

The agent terminal remained open while the agent was in use.

### Agent Execution Verification

A Freestyle job named `04-linux-agent-execution-demo` was configured with the label restriction:

`linux-agent`

The job inspected:

- Current Linux user.
- User and group IDs.
- Hostname.
- Operating system information.
- Jenkins workspace.
- Java version.

The build console confirmed:

- Build executed remotely on `linux-agent-02`.
- Execution identity was `jenkins-agent`.
- UID was `1002`.
- Workspace was `/home/jenkins-agent/workspace/04-linux-agent-execution-demo`.
- Java 21 was available.
- The identity verification passed.

The build completed successfully.

### Controller and Agent Responsibilities

| Component | Responsibility |
|---|---|
| Jenkins controller | Job scheduling, configuration, coordination and build results |
| Jenkins agent | Executes assigned build steps |
| Agent workspace | Stores files used during remote build execution |
| WebSocket connection | Connects the inbound agent to the controller |
| Linux agent account | Provides the operating-system identity for build execution |


## 4. Jenkins Controller Backup

A Jenkins controller backup protects important configuration and operational data.

The lab performed a backup of the Jenkins home directory:

`/var/lib/jenkins`

### Backup Preparation

Before creating the backup, the Jenkins service was stopped to reduce the risk of inconsistent files being archived.

The agent process was also stopped before the backup exercise.

The Jenkins service state was checked:

```bash
sudo systemctl is-active jenkins
sudo systemctl is-enabled jenkins
```

### Backup Location

The backup was stored outside the Jenkins home directory:

`/var/backups/jenkins/`

The corrected archive name was:

`jenkins-home-backup-corrected.tar.gz`

### Backup Command

The following command created the compressed backup:

```bash
sudo tar \
  --exclude='jenkins/workspace' \
  --exclude='jenkins/caches' \
  -czf /var/backups/jenkins/jenkins-home-backup-corrected.tar.gz \
  -C /var/lib jenkins
```

The archive excluded:

- Jenkins workspaces.
- Jenkins caches.

These directories can contain large amounts of temporary or regenerable data.

### Backup File Permissions

The archive was restricted to root access:

```bash
sudo chmod 600 /var/backups/jenkins/jenkins-home-backup-corrected.tar.gz
```

The resulting archive was approximately 160 MB.

Its SHA-256 checksum was recorded:

`a2c0a6ececa649df99899730c3d637f0084aba7419b2b1a04e9c1a46616e3b1b`

### Backup Exclusion Verification

The archive contents were checked using:

```bash
sudo tar -tzf /var/backups/jenkins/jenkins-home-backup-corrected.tar.gz \
  | grep -E '^jenkins/(workspace|caches)(/|$)'
```

The command returned no matching entries.

This verified that the corrected archive excluded both workspace and cache directories.

### Important Backup Security Consideration

The Jenkins home directory can contain sensitive information, including:

- Credentials and credential configuration.
- Jenkins encryption keys.
- Job configuration.
- User and security configuration.
- Plugin configuration.

The backup archive must therefore be treated as sensitive data.

It must not be committed to GitHub or included in a public portfolio repository.

### Restore Testing Limitation

The backup archive was created and its exclusions were verified.

A complete restoration into a separate Jenkins environment was not performed.

Therefore, the exercise demonstrates backup creation and verification, but does not establish that a full disaster recovery process has been tested.


## 5. Jenkins Restart and Agent Reconnection

After the backup exercise, Jenkins was restarted and its service health was verified.

The following command was used to check the service:

```bash
sudo systemctl status jenkins
```

The Jenkins service returned to the active state.

The inbound agent was then restarted using its connection command.

Jenkins successfully reconnected to `linux-agent-02`.

The remote execution job was run again and completed successfully.

This verified that the agent could reconnect after a Jenkins controller restart.

## 6. Troubleshooting

### Jenkins Service Does Not Start

Check:

```bash
sudo systemctl status jenkins
sudo journalctl -u jenkins -n 100 --no-pager
```

Possible causes include:

- Java configuration problems.
- Invalid Jenkins service configuration.
- Port 8080 already in use.
- File permission problems.
- Plugin startup failures.

### Agent Remains Offline

Check:

- The agent process is running.
- The controller URL is correct.
- The agent name matches the Jenkins node configuration.
- The connection secret is current.
- Java is available to the agent account.
- The WebSocket connection can reach the controller.

Review the agent terminal output and Jenkins node status.

### Remote Build Fails

Check:

- The job is restricted to the correct label.
- The agent is online.
- The agent account has access to its remote root directory.
- Required commands are installed.
- The workspace is writable.

Use the build console to confirm whether the job executed on the expected agent.

### Backup Archive Is Incorrect

Check:

- Jenkins was stopped before the backup.
- The archive path is correct.
- Exclusion patterns match the intended directory paths.
- The archive can be listed using `tar -tzf`.
- File permissions restrict access to the archive.

Do not assume that successful archive creation proves that restoration will work.

## 7. Security Review and Best Practices

The exercises demonstrate several important Jenkins security practices.

### Credentials

- Store secrets in Jenkins Credentials.
- Avoid hardcoding credentials in scripts.
- Do not print real secret values.
- Use the narrowest practical credential scope.
- Rotate credentials if they are accidentally exposed.

### Agents

- Use dedicated operating-system accounts for agents.
- Restrict agent directory permissions.
- Limit agent executors to the required workload.
- Use labels to control job placement.
- Protect agent connection secrets.

### Controller

- Restrict access to the Jenkins administration interface.
- Keep Jenkins and its plugins updated.
- Review controller and agent security warnings.
- Avoid running unnecessary workloads on the controller.
- Protect the Jenkins home directory and backups.

### Repository Hygiene

Before publishing the project:

- Check for credentials, tokens, and private keys.
- Exclude Jenkins home backups.
- Exclude local agent secrets and connection files.
- Exclude temporary build output and logs.
- Review hidden files and repository changes.
- Verify `.gitignore` rules.

## 8. Lab Limitations

The following limitations apply to this implementation:

- The Jenkins controller and agent ran on the same WSL2 host.
- The agent used an inbound WebSocket connection.
- GitHub source checkout used a public repository.
- A GitHub webhook was not configured.
- The credentials exercise used a disposable demonstration secret.
- The backup was created and verified, but a complete restore test was not performed.
- Production-grade high availability and disaster recovery were outside the scope of this lab.

## 9. Key Learning Outcomes

After completing these exercises, the following concepts were demonstrated:

- Jenkins Credentials and secret binding.
- Console masking behavior and its limitations.
- Dedicated Linux accounts for build agents.
- Inbound agent configuration.
- Label-based remote build execution.
- Controller and agent responsibilities.
- Jenkins home directory backup.
- Backup exclusions and permission restrictions.
- Service restart and agent reconnection.
- Jenkins troubleshooting and security review.

This project demonstrates foundational Jenkins administration through practical exercises. It is an independent learning and portfolio project, not a production deployment.
