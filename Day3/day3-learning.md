# Day 3 Linux Learning

## Linux File Permissions

Command Syntax:
ls -l

Example:
ls -l

Pronunciation:
ell-ess dash ell

Meaning:
Display detailed file information including permissions

Use:
Shows:
 - file type
 - permissions
 - ownership
 - file size
 - timestamps

When to use:
When inspecting file access permissions, ownership details or Linux file metadata

Real DevOps Importance:
Used for:
 - permission troubleshooting
 - deployment debugging
 - ownership verification
 - security auditing
 - server administration


## Permission Symbols

Permission Symbols:
r w x -

Permission String Example:
rwxr-xr-x

Pronunciation:
are double-you ex

Meaning:
r means read
w means write
x means execute
- means permission absent

Use:
Represents:
 - read permissions
 - write permissions
 - execute permissions
 - restricted access

When to use:
When decoding or modifying Linux file permissions

Real DevOps Importance:
Used for:
 - access control
 - Linux security management
 - deployment permissions
 - container file permissions
 - server hardening


## chmod

Command Syntax:
chmod <permissions> <file-name>

Example:
chmod +x script.sh

Pronunciation:
see-ehch-mod

Meaning:
Change file/directory permissions

Use:
Used to:
 - add permissions
 - remove permissions
 - control file access
 - manage execution rights

When to use:
When controlling Linux file or directory permissions

Real DevOps Importance:
Used for:
 - deployment scripting
 - executable permission management
 - CI/CD automation
 - Docker container setup
 - Linux server administration


## chmod +x

Command Syntax:
chmod +x <file-name>

Example:
chmod +x script.sh

Pronunciation:
see-ehch-mod plus ex

Meaning:
Add execute permission

Use:
Used to:
 - make scripts executable
 - enable program execution
 - allow shell script execution

When to use:
When shell scripts/programs need execution permission

Real DevOps Importance:
Used for:
 - deployment scripts
 - automation tools
 - CI/CD pipeline scripts
 - startup scripts
 - DevOps shell scripting


## chmod -x

Command Syntax:
chmod -x <file-name>

Example:
chmod -x script.sh

Pronunciation:
see-ehch-mod minus ex

Meaning:
Remove execute permission

Use:
Used to:
 - restrict execution
 - disable script execution
 - secure files

When to use:
When executable access should be restricted

Real DevOps Importance:
Used for:
 - security hardening
 - restricting unauthorized execution
 - protecting production systems
 - controlling deployment scripts
 - Linux access management


## chmod u+x

Command Syntax:
chmod u+x <file-name>

Example:
chmod u+x script.sh

Pronunciation:
see-ehch-mod user plus ex

Meaning:
Add execute permission for owner only

Use:
Used to:
 - allow owner execution
 - restrict execution to owner
 - secure script access

When to use:
When only owner should execute script/program

Real DevOps Importance:
Used for:
 - secure script execution
 - restricted administrative access
 - deployment control
 - Linux permission management
 - server security


## chmod g+w

Command Syntax:
chmod g+w <file-name>

Example:
chmod g+w script.sh

Pronunciation:
see-ehch-mod group plus double-you

Meaning:
Add write permission for group

Use:
Used to:
 - allow group modifications
 - enable collaborative editing
 - manage shared files

When to use:
When collaborative group editing is required

Real DevOps Importance:
Used for:
 - team-based server management
 - shared deployment directories
 - collaborative DevOps workflows
 - log management
 - infrastructure administration


## chmod o+x

Command Syntax:
chmod o+x <file-name>

Example:
chmod o+x script.sh

Pronunciation:
see-ehch-mod others plus ex

Meaning:
Add execute permission for others

Use:
Used to:
 - allow public execution
 - enable shared script usage
 - provide executable access

When to use:
When scripts/programs should be executable by all users

Real DevOps Importance:
Used for:
 - public utility scripts
 - shared automation tools
 - multi-user server environments
 - application execution
 - Linux administration


## chmod u-w

Command Syntax:
chmod u-w <file-name>

Example:
chmod u-w script.sh

Pronunciation:
see-ehch-mod user minus double-you

Meaning:
Remove write permission for owner

Use:
Used to:
 - prevent modifications
 - protect important files
 - restrict editing

When to use:
When accidental modification protection is needed

Real DevOps Importance:
Used for:
 - protecting configuration files
 - production security
 - deployment stability
 - preventing accidental changes
 - Linux access control


## Numeric Permissions

Command Syntax:
chmod <number> <file-name>

Example:
chmod 755 script.sh

Pronunciation:
numeric permissions

Meaning:
Linux permission representation using numbers

Use:
Used to:
 - assign permissions quickly
 - standardize access control
 - simplify permission management

When to use:
When standard Linux permission patterns are required

Real DevOps Importance:
Used for:
 - infrastructure automation
 - deployment scripts
 - Docker image configuration
 - CI/CD workflows
 - Linux server setup


## chmod 755

Command Syntax:
chmod 755 <file-name>

Example:
chmod 755 script.sh

Pronunciation:
seven five five

Meaning:
Owner gets read, write and execute permissions while group and others get read and execute permissions

Use:
Used for:
 - executable scripts
 - shared program execution
 - controlled write access

When to use:
When scripts/programs should be executable by all users

Real DevOps Importance:
Used for:
 - deployment scripts
 - executable automation tools
 - CI/CD scripts
 - Linux application setup
 - Docker entrypoint scripts


## chmod 644

Command Syntax:
chmod 644 <file-name>

Example:
chmod 644 script.sh

Pronunciation:
six four four

Meaning:
Owner gets read and write permissions while group and others get read-only permissions

Use:
Used for:
 - normal files
 - configuration files
 - controlled modification access

When to use:
When files should not be executable

Real DevOps Importance:
Used for:
 - configuration management
 - secure file permissions
 - application configs
 - deployment files
 - infrastructure setup


## whoami

Command Syntax:
whoami

Example:
whoami

Pronunciation:
who-am-I

Meaning:
Display current logged-in user

Use:
Used to:
 - verify active user
 - confirm login identity
 - inspect current shell user

When to use:
When verifying current Linux user identity

Real DevOps Importance:
Used for:
 - permission troubleshooting
 - deployment verification
 - user access validation
 - server administration
 - automation debugging


## id

Command Syntax:
id

Example:
id

Pronunciation:
eye-dee

Meaning:
Display user and group identity information

Use:
Displays:
 - UID
 - GID
 - group memberships

When to use:
When inspecting Linux user/group information

Real DevOps Importance:
Used for:
 - permission debugging
 - access management
 - user verification
 - container user mapping
 - Linux security troubleshooting


## uid

Term:
uid

Example:
uid=1000(abhinav)

Pronunciation:
user-id

Meaning:
Unique numeric identifier for a Linux user

Use:
Used to:
 - identify Linux users
 - manage ownership
 - control permissions

When to use:
When inspecting user-related Linux information

Real DevOps Importance:
Used for:
 - container user mapping
 - Linux access control
 - permission troubleshooting
 - user management
 - infrastructure security


## gid

Term:
gid

Example:
gid=1000(abhinav)

Pronunciation:
group-id

Meaning:
Unique numeric identifier for a Linux group

Use:
Used to:
 - identify Linux groups
 - manage shared permissions
 - control group access

When to use:
When inspecting Linux group ownership or permissions

Real DevOps Importance:
Used for:
 - shared server access
 - collaborative environments
 - group permission management
 - Linux administration
 - infrastructure security


## sudo

Command Syntax:
sudo <command>

Example:
sudo ls /root

Pronunciation:
soo-doo

Meaning:
Execute command with superuser privileges

Use:
Used to:
 - run administrative commands
 - access protected resources
 - perform system-level operations

When to use:
When elevated Linux permissions are required

Real DevOps Importance:
Used constantly for:
 - server administration
 - package installation
 - service management
 - deployment operations
 - infrastructure maintenance


## root User

Term:
root

Example:
sudo ls /root

Pronunciation:
root

Meaning:
Linux superuser/administrator account

Use:
Provides:
 - unrestricted system access
 - administrative control
 - full Linux privileges

When to use:
When performing system-level administrative tasks

Real DevOps Importance:
Used for:
 - server administration
 - infrastructure management
 - production operations
 - deployment control
 - Linux system maintenance


## Hidden Files

Command Syntax:
ls -la

Example:
ls -la /root

Pronunciation:
hidden files

Meaning:
Files/directories starting with dot (.)

Use:
Used to:
 - store configurations
 - manage environment settings
 - maintain system data

When to use:
When inspecting Linux configuration or system directories

Real DevOps Importance:
Used for:
 - environment configuration
 - Git repository management
 - shell customization
 - deployment settings
 - Linux administration


## chown

Command Syntax:
chown <owner> <file-name>

Example:
sudo chown root script.sh

Pronunciation:
see-own

Meaning:
Change file/directory ownership

Use:
Used to:
 - assign file ownership
 - manage user access
 - control administrative ownership

When to use:
When ownership reassignment or access control is needed

Real DevOps Importance:
Used for:
 - deployment ownership management
 - Docker volume permissions
 - application access control
 - Linux administration
 - infrastructure security


## chown owner:group

Command Syntax:
chown <owner>:<group> <file-name>

Example:
sudo chown root:root script.sh

Pronunciation:
see-own owner group

Meaning:
Change both owner and group ownership

Use:
Used to:
 - assign owner and group together
 - manage collaborative access
 - standardize permissions

When to use:
When files/directories must belong to specific users and groups

Real DevOps Importance:
Used for:
 - deployment directory setup
 - shared infrastructure access
 - application ownership management
 - Linux security
 - production server administration


## ./script.sh

Command Syntax:
./<script-name>

Example:
./script.sh

Pronunciation:
dot slash script-name

Meaning:
Execute script from current directory

Use:
Used to:
 - run local scripts
 - execute shell programs
 - start executable files

When to use:
When executing shell scripts or local programs

Real DevOps Importance:
Used constantly for:
 - deployment scripts
 - automation workflows
 - CI/CD tasks
 - infrastructure setup
 - Linux shell scripting
