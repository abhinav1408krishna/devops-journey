# Jenkins Installation and Configuration

## 1. Environment

Jenkins was installed on Ubuntu 24.04 running under WSL2.

The environment uses:
- Ubuntu 24.04
- systemd 255
- OpenJDK 21
- Jenkins LTS 2.580.2
- Jenkins home: `/var/lib/jenkins`
- HTTP port: `8080`

## 2. Java Configuration

Jenkins requires a supported Java runtime.

The configured Java installation:

`/usr/lib/jvm/java-21-openjdk-amd64`

Verification commands:

```bash
java -version
echo "$JAVA_HOME"
which java
```

## 3. Jenkins Service

Jenkins runs as a systemd service under the Linux account `jenkins`.

Important service settings observed:

- User: `jenkins`
- Group: `jenkins`
- JENKINS_HOME: `/var/lib/jenkins`
- WorkingDirectory: `/var/lib/jenkins`
- JENKINS_PORT: `8080`

Inspect the installed service definition using `systemctl cat jenkins`.

## 4. Service Management

Useful commands:

- `sudo systemctl status jenkins --no-pager`
- `systemctl is-active jenkins`
- `systemctl is-enabled jenkins`
- `sudo systemctl start jenkins`
- `sudo systemctl stop jenkins`
- `sudo systemctl restart jenkins`
- `sudo journalctl -u jenkins -n 50 --no-pager`

Command purposes:

- `start`: starts Jenkins.
- `stop`: stops Jenkins.
- `restart`: stops and starts Jenkins.
- `status`: reports service state.
- `is-enabled`: checks boot-time enablement.
- `journalctl`: displays service logs recorded by systemd.

After changing systemd unit files, `daemon-reload` reloads unit definitions. It does not itself restart Jenkins.

## 5. Jenkins Home

The Jenkins home directory is `/var/lib/jenkins`.

It contains important persistent information, including:

- Job configuration
- Build records
- Plugin data
- Credentials-related data
- Controller configuration

Treat Jenkins home as sensitive administrative data.

## 6. Initial Setup and Plugins

The Jenkins initial setup wizard was completed and an administrator account was configured.

Plugins installed for this lab included:

- Git
- Git Client
- GitHub
- GitHub Branch Source
- Pipeline and Pipeline utilities
- Credentials
- Credentials Binding
- Workspace Cleanup
- Timestamper
- Email Extension and dependencies

Plugins extend Jenkins functionality. Install only the plugins required by the workload and review their maintenance and security before updates.

## 7. Controller and Built-in Node

The controller and built-in node were inspected through Jenkins.

The built-in node provides execution capacity on the controller host. Builds running there execute on the controller machine.

For production environments, avoid running untrusted build workloads on the controller where possible. This lab also created a separate agent execution identity.

## 8. Local Access

The Jenkins interface was accessed at `http://localhost:8080`.

This is a local WSL development environment, not a public production deployment.

## 9. Operational Verification

After installation or restart, run:

- `systemctl is-active jenkins`
- `systemctl is-enabled jenkins`
- `sudo journalctl -u jenkins -n 40 --no-pager`

Then open the Jenkins interface and verify that the dashboard loads.

## 10. Troubleshooting

If Jenkins does not start:

1. Inspect `systemctl status jenkins`.
2. Inspect `journalctl -u jenkins`.
3. Check whether port 8080 is already in use.
4. Check Java availability and service environment.
5. Check ownership and permissions under Jenkins home.
6. Review recent plugin or configuration changes.

Do not recursively change ownership or permissions without first identifying the affected path and expected service identity.
