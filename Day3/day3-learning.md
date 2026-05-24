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
Shows file type, permissions, ownership and timestamps

When to use:
When inspecting file access permissions and ownership details


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
Represent read, write and execute permissions

When to use:
When decoding or modifying Linux permissions


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
Adds or removes permissions from files/directories

When to use:
When controlling access or execution rights


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
Makes file executable

When to use:
When shell scripts/programs need execution permission


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
Removes file execution rights

When to use:
When executable access should be restricted


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
Grants execution rights specifically to file owner

When to use:
When only owner should execute a script/program


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
Allows group members to modify file

When to use:
When collaborative group editing is required


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
Allows other users to execute file

When to use:
When publicly executable scripts/programs are needed


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
Prevents owner from modifying file

When to use:
When accidental modification protection is needed


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
Quickly assign Linux permissions numerically

When to use:
When standard Linux permission patterns are required


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
Common permission setting for executable scripts

When to use:
When scripts/programs should be executable by all users


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
Common permission setting for normal files

When to use:
When files should not be executable


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
Shows active Linux username

When to use:
When verifying current user identity


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
Shows UID, GID and group memberships

When to use:
When inspecting Linux user/group information


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
Identifies users internally in Linux systems

When to use:
When inspecting permissions, ownership or user-related system information


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
Identifies groups internally in Linux systems

When to use:
When inspecting group ownership or group permissions


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
Runs administrative/root-level commands

When to use:
When elevated permissions are required


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
Provides unrestricted system access and administrative control

When to use:
When performing system-level administration tasks


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
Store Linux configuration and system data

When to use:
When inspecting configuration or system directories


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
Changes owner of file/directory

When to use:
When ownership control or administrative reassignment is needed


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
Assigns both ownership and group ownership

When to use:
When files/directories must belong to specific users and groups


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
Runs executable scripts/files from current location

When to use:
When executing shell scripts or local programs
