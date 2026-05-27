# Day 4 Linux Learning

## ps

Command Syntax:
ps

Example:
ps

Pronunciation:
process status

Meaning:
Display running processes associated with current terminal/session

Use:
Shows active processes currently running in the shell session

When to use:
When checking which commands/programs are currently running in your terminal

Real DevOps Importance:
Used for:
 - troubleshooting shell processes
 - debugging scripts
 - monitoring active terminal commands
 - checking running sessions


## ps -e

Command Syntax:
ps -e

Example:
ps -e

Pronunciation:
process status dash e

Meaning:
Display all running processes in the Linux system

Use:
Shows system-wide running processes including services and background daemons

When to use:
When inspecting overall Linux system activity and running services

Real DevOps Importance:
Used to monitor:
 - application services
 - Docker processes
 - Kubernetes components
 - Linux background services
 - production server activity


## ps -ef

Command Syntax:
ps -ef

Example:
ps -ef

Pronunciation:
process status dash e f

Meaning:
Display all running processes with full detailed information

Use:
Shows process owner, PID, parent PID and executed command details

When to use:
When troubleshooting Linux systems or investigating running applications/process hierarchies

Real DevOps Importance:
Used for:
 - server troubleshooting
 - container debugging
 - CI/CD monitoring
 - process investigation
 - identifying problematic applications


## PID

Term:
PID

Example:
PID 331

Pronunciation:
process-id

Meaning:
Unique numeric identifier assigned to every running process

Use:
Identifies individual running processes inside Linux

When to use:
When monitoring, tracking or terminating specific processes

Real DevOps Importance:
Used for:
 - killing stuck services
 - restarting applications
 - troubleshooting containers
 - tracking process behavior
 - process monitoring


## top

Command Syntax:
top

Example:
top

Pronunciation:
top

Meaning:
Interactive real-time Linux process monitoring tool

Use:
Displays live CPU usage, memory usage, running processes and system load

When to use:
When monitoring server performance, resource consumption or system activity

Real DevOps Importance:
Used for:
 - production server monitoring
 - CPU bottleneck analysis
 - memory troubleshooting
 - infrastructure monitoring
 - identifying resource-heavy processes


## htop

Command Syntax:
htop

Example:
htop

Pronunciation:
h-top

Meaning:
Interactive advanced Linux process monitoring tool

Use:
Provides user-friendly real-time system and process monitoring

When to use:
When monitoring Linux systems interactively with improved readability and process management controls

Real DevOps Importance:
Used for:
 - easier server monitoring
 - process troubleshooting
 - interactive process management
 - infrastructure observation
 - Linux administration


## Pipe |

Symbol:
|

Example:
ps -ef | grep docker

Pronunciation:
pipe

Meaning:
Pass output of one command as input to another command

Use:
Combines multiple Linux commands together

When to use:
When filtering, processing or chaining command outputs

Real DevOps Importance:
Used heavily in:
 - shell scripting
 - log analysis
 - automation workflows
 - command chaining
 - DevOps scripting


## grep docker

Command Syntax:
grep <keyword>

Example:
ps -ef | grep docker

Pronunciation:
grep docker

Meaning:
Search lines matching specified keyword or pattern

Use:
Filters command outputs using matching text

When to use:
When searching processes, logs, files or command outputs

Real DevOps Importance:
Used for:
 - log analysis
 - troubleshooting applications
 - monitoring services
 - debugging production systems
 - searching configuration files


## kill

Command Syntax:
kill <PID>

Example:
kill 1234

Pronunciation:
kill

Meaning:
Terminate running process using process ID

Use:
Stops active Linux processes

When to use:
When applications, scripts or services must be stopped manually

Real DevOps Importance:
Used for:
 - stopping failed applications
 - restarting services
 - terminating stuck processes
 - server administration
 - workload management


## sleep

Command Syntax:
sleep <seconds>

Example:
sleep 300

Pronunciation:
sleep

Meaning:
Pause process execution for specified duration

Use:
Creates delays or temporary waiting periods

When to use:
When testing process management or adding delays in shell scripts

Real DevOps Importance:
Used in:
 - automation scripts
 - deployment workflows
 - CI/CD pipelines
 - shell scripting
 - scheduled task testing


## Background Process

Command Syntax:
<command> &

Example:
sleep 300 &

Pronunciation:
background process

Meaning:
Run process independently in background

Use:
Allows terminal to remain usable while process continues running

When to use:
When long-running commands or services should continue without blocking terminal access

Real DevOps Importance:
Important for:
 - running servers
 - Docker services
 - monitoring agents
 - automation tasks
 - long-running scripts


## Foreground Process

Example:
sleep 300

Pronunciation:
foreground process

Meaning:
Process directly attached to current terminal session

Use:
Runs interactively while occupying terminal

When to use:
When interacting directly with commands or applications

Real DevOps Importance:
Important for:
 - interactive command execution
 - terminal process control
 - Linux process understanding
 - troubleshooting running commands
 - application interaction


## jobs

Command Syntax:
jobs

Example:
jobs

Pronunciation:
jobs

Meaning:
Display background jobs started from current terminal

Use:
Shows running or stopped background jobs and their status

When to use:
When managing terminal background processes

Real DevOps Importance:
Used for:
 - shell task management
 - background process monitoring
 - terminal workflow management
 - automation handling
 - multitasking in Linux terminals


## fg

Command Syntax:
fg

Example:
fg

Pronunciation:
foreground

Meaning:
Bring background process/job back to foreground

Use:
Moves background process into active terminal interaction

When to use:
When interacting again with previously backgrounded jobs

Real DevOps Importance:
Used for:
 - terminal job control
 - recovering background tasks
 - interactive process handling
 - Linux shell management
 - process interaction


## Ctrl + C

Shortcut:
Ctrl + C

Example:
Ctrl + C

Pronunciation:
control see

Meaning:
Interrupt currently running foreground process

Use:
Stops active commands/processes running in terminal

When to use:
When terminating commands or stopping interactive programs

Real DevOps Importance:
Used constantly for:
 - stopping failed scripts
 - terminating hanging commands
 - interrupting long-running tasks
 - debugging shell commands
 - process interruption


## kill -9

Command Syntax:
kill -9 <PID>

Example:
kill -9 1234

Pronunciation:
kill minus nine

Meaning:
Forcefully terminate running process immediately

Use:
Stops stubborn or unresponsive processes forcefully

When to use:
When normal process termination fails or process becomes unresponsive

Real DevOps Importance:
Used for:
 - emergency process termination
 - recovering frozen applications
 - container troubleshooting
 - production issue handling
 - stopping unresponsive services
