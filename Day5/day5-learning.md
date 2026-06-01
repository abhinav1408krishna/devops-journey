# Day 5 Linux Learning

## apt

Command Syntax:
apt

Example:
apt

Pronunciation:
apt

Meaning:
APT (Advanced Package Tool) is the package management utility used in Debian-based Linux distributions such as Ubuntu.

Use:
Manage software packages from repositories.

When to use:
When installing, removing, upgrading or managing software packages.

Real DevOps Importance:
Used for:
 - installing DevOps tools
 - managing software dependencies
 - maintaining Linux servers
 - applying security updates
 - managing production environments

Key Learning:
 APT is the primary package management tool used in Ubuntu.

## apt update

Command Syntax:
sudo apt update

Example:
sudo apt update

Pronunciation:
apt update

Meaning:
Downloads the latest package information and metadata from configured repositories.

Use:
Refresh package lists available from repositories.

When to use:
Before installing or upgrading packages.

Real DevOps Importance:
Used for:
 - refreshing package repositories
 - preparing servers for upgrades
 - maintaining updated package information
 - supporting secure system maintenance

Key Learning:
 apt update does not upgrade packages.

It only refreshes package metadata and package lists.

## apt upgrade

Command Syntax:
sudo apt upgrade

Example:
sudo apt upgrade

Pronunciation:
apt upgrade

Meaning:
Upgrades installed packages to newer versions available in repositories.

Use:
Upgrade installed software packages.

When to use:
After running apt update.

Real DevOps Importance:
Used for:
 - performing server maintenance
 - applying security patches
 - fixing vulnerabilities
 - keeping production systems updated

Key Learning:
 - apt update refreshes package information.
 - apt upgrade installs newer package versions using that information.

## apt install

Command Syntax:
sudo apt install <package-name>

Example:
sudo apt install tree

Pronunciation:
apt install

Meaning:
Installs a package from configured repositories.

Use:
Install software packages.

When to use:
When adding new software to a system.

Real DevOps Importance:
Used to install:
 - Docker
 - Git
 - Jenkins
 - Terraform
 - monitoring tools

Key Learning:
 Packages can be installed directly from Ubuntu repositories.

## apt remove

Command Syntax:
sudo apt remove <package-name>

Example:
sudo apt remove tree

Pronunciation:
apt remove

Meaning:
Removes an installed package from the system.

Use:
Uninstall software packages.

When to use:
When software is no longer required.

Real DevOps Importance:
Used for:
 - removing deprecated tools
 - uninstalling problematic software
 - reducing attack surface
 - maintaining clean server environments

Key Learning:
 Removing a package deletes the software but may leave configuration files behind.

## which

Command Syntax:
which <command>

Example:
which tree

Meaning:
Displays the location of a command executable.

Use:
Locate executables in the system PATH.

When to use:
When verifying command installations or troubleshooting PATH issues.

Real DevOps Importance:
Used for:
 - verifying tool installations
 - locating binaries
 - troubleshooting environment issues
 - validating software deployments

Key Learning:
 which searches directories listed in the PATH environment variable.

## Service

Term:
Service

Pronunciation:
service

Meaning:
A long-running background process that performs a specific function for the system or users.

Use:
Provides functionality continuously in the background.

When to use:
Whenever applications or system components need to run continuously.

Examples:
 - Docker service
 - cron service
 - Jenkins service
 - Nginx service

Real DevOps Importance:
Used for:
 - running applications
 - automation tasks
 - infrastructure services
 - monitoring components

Key Learning:
 Most production applications run as services.

## systemctl

Command Syntax:
systemctl

Example:
systemctl

Pronunciation:
system-control

Meaning:
System and service manager used to manage Linux services.

Use:
Manage Linux services.

When to use:
When starting, stopping, restarting or monitoring services.

Real DevOps Importance:
Used to manage:
 - Docker services
 - Jenkins services
 - Kubernetes components
 - web servers
 - databases

Key Learning:
 Most modern Linux services are managed through systemd using systemctl.

## systemctl status

Command Syntax:
systemctl status <service>

Example:
systemctl status docker

Pronunciation:
system-control status

Meaning:
Displays detailed information about a service.

Use:
Check service health and status.

When to use:
When troubleshooting or monitoring services.

Real DevOps Importance:
Used to monitor:
 - application services
 - Docker services
 - Kubernetes components
 - databases
 - web servers

Key Learning:
Important fields:
 - Loaded
 - Active
 - Main PID

Example:
 Active: active (running)

 ACTIVE state:
  - active

 SUB state:
  - running

## systemctl stop

Command Syntax:
sudo systemctl stop <service>

Example:
sudo systemctl stop cron

Pronunciation:
system-control stop

Meaning:
Stops a running service.

Use:
Stop services safely.

When to use:
During troubleshooting or maintenance.

Real DevOps Importance:
Used to:
 - stop application services
 - stop web servers
 - stop monitoring agents
 - perform maintenance

Key Learning:
 Stopping a service terminates its running process.

## systemctl start

Command Syntax:
sudo systemctl start <service>

Example:
sudo systemctl start cron

Pronunciation:
system-control start

Meaning:
Starts a stopped service.

Use:
Start services.

When to use:
When recovering or enabling services.

Real DevOps Importance:
Used to:
 - start Docker
 - start Jenkins
 - start web servers
 - recover application services

Key Learning:
 Starting a service creates a new running process.

## systemctl restart

Command Syntax:
sudo systemctl restart <service>

Example:
sudo systemctl restart cron

Pronunciation:
 - system-control restart

Meaning:
 - Stops a service and immediately starts it again.

Use:
 - Reload services.

When to use:
 - After configuration changes or troubleshooting.

Real DevOps Importance:
Used to manage:
 - Docker
 - Jenkins
 - Nginx
 - databases
 - monitoring agents

Key Learning:
 - systemctl restart = stop + start
 - The PID changes because the old process is terminated and a new process is created.

## journalctl

Command Syntax:
journalctl

Example:
journalctl

Pronunciation:
journal-control

Meaning:
Displays logs collected by systemd for the entire system.

Use:
View system logs.

When to use:
When investigating system-level issues.

Real DevOps Importance:
Used for:
 - operating system troubleshooting
 - service failure investigation
 - infrastructure incident analysis
 - production debugging

Key Learning:
 journalctl displays logs for the entire system.

## journalctl -u <service>

Command Syntax:
journalctl -u <service>

Example:
journalctl -u cron

Pronunciation:
journal-control dash u service

Meaning:
Displays logs for a specific service.

Use:
View logs for a specific service.

When to use:
When troubleshooting an individual service.

Real DevOps Importance:
Used to monitor:
 - Docker services
 - Jenkins services
 - Kubernetes components
 - application services

Key Learning:
 Used when troubleshooting a specific service instead of the entire system.

## journalctl -u <service> --no-pager

Command Syntax:
journalctl -u <service> --no-pager

Example:
journalctl -u cron --no-pager

Pronunciation:
journal-control dash u service no pager


Meaning:
Displays service logs directly in the terminal without opening a pager.

Use:
View complete logs directly in the terminal.

When to use:
When troubleshooting services from the command line.

Real DevOps Importance:
Used for:
 - incident investigations
 - service troubleshooting
 - production debugging
 - root cause analysis

Key Learning:
 Observed:
  - Stopping cron.service...
  - Started cron.service...
  - session opened for user root
  - session closed for user root
 Logs provide valuable information about service behavior and troubleshooting.

## Notes

Useful journalctl Commands:
journalctl -f
 - Follow logs in real time

journalctl -b
 - Show logs from current boot

journalctl -xe
 - Show detailed logs and recent errors

journalctl -u docker
 - Show Docker service logs

journalctl -u jenkins
 - Show Jenkins service logs

## Day 5 Summary

Topics Learned:
 - apt
 - apt update
 - apt upgrade
 - apt install
 - apt remove
 - which
 - Service
 - systemctl
 - systemctl status
 - systemctl stop
 - systemctl start
 - systemctl restart
 - journalctl
 - journalctl -u <service>
 - journalctl -u <service> --no-pager

Key DevOps Concepts:
 - package management
 - software installation
 - package upgrades
 - Linux services
 - service monitoring
 - service lifecycle management
 - process IDs (PIDs)
 - system logging
 - troubleshooting using logs
