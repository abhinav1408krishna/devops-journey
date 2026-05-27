# Day 2 Linux Learning

## pwd

Command Syntax:
pwd

Example:
pwd

Pronunciation:
present working directory

Meaning:
Display current working directory path

Use:
Shows the current directory location in the Linux filesystem

When to use:
When verifying current location before executing file or directory operations

Real DevOps Importance:
Used for:
 - verifying working directories
 - navigating project structures
 - checking deployment paths
 - shell scripting
 - infrastructure automation


## ls

Command Syntax:
ls

Example:
ls

Pronunciation:
ell-ess

Meaning:
List files and directories

Use:
Displays contents of current directory

When to use:
When checking available files, folders or project contents

Real DevOps Importance:
Used for:
 - inspecting server directories
 - checking deployment files
 - viewing configuration folders
 - verifying application artifacts
 - filesystem navigation


## ls -l

Command Syntax:
ls -l

Example:
ls -l

Pronunciation:
ell-ess dash ell

Meaning:
Display detailed file and directory information

Use:
Shows permissions, ownership, size and timestamps

When to use:
When inspecting file metadata or Linux permissions

Real DevOps Importance:
Used for:
 - permission troubleshooting
 - ownership verification
 - deployment debugging
 - security auditing
 - server administration


## ls -a

Command Syntax:
ls -a

Example:
ls -a

Pronunciation:
ell-ess dash a

Meaning:
Display all files including hidden files

Use:
Shows hidden Linux configuration files/directories

When to use:
When inspecting configuration or system files

Real DevOps Importance:
Used for:
 - viewing hidden configuration files
 - checking Git repositories
 - inspecting environment files
 - debugging Linux environments
 - server configuration management


## cd

Command Syntax:
cd <directory-name>

Example:
cd Day2

Pronunciation:
change directory

Meaning:
Navigate between directories

Use:
Moves terminal into specified directory

When to use:
When navigating Linux filesystem or project folders

Real DevOps Importance:
Used for:
 - navigating server directories
 - accessing deployment locations
 - managing project structures
 - shell scripting
 - infrastructure management


## mkdir

Command Syntax:
mkdir <directory-name>

Example:
mkdir test1

Pronunciation:
make directory

Meaning:
Create new directory

Use:
Creates folders in Linux filesystem

When to use:
When organizing files or creating project structures

Real DevOps Importance:
Used for:
 - creating application directories
 - organizing deployment structures
 - preparing log folders
 - infrastructure setup
 - automation scripting


## touch

Command Syntax:
touch <file-name>

Example:
touch text.txt

Pronunciation:
touch

Meaning:
Create empty file

Use:
Creates new files or updates file timestamps

When to use:
When creating files quickly from terminal

Real DevOps Importance:
Used for:
 - creating configuration files
 - initializing logs
 - creating scripts
 - deployment preparation
 - automation workflows


## cat

Command Syntax:
cat <file-name>

Example:
cat text.txt

Pronunciation:
cat

Meaning:
Display file contents

Use:
Reads and prints file content directly in terminal

When to use:
When viewing configuration files, scripts or logs

Real DevOps Importance:
Used for:
 - reading configuration files
 - checking logs
 - inspecting scripts
 - debugging deployments
 - viewing application outputs


## head

Command Syntax:
head <file-name>

Example:
head day2-learning.md

Pronunciation:
head

Meaning:
Display first 10 lines of file

Use:
Quickly previews beginning section of file

When to use:
When inspecting headers, configs or initial log entries

Real DevOps Importance:
Used for:
 - checking log beginnings
 - inspecting configuration headers
 - verifying generated files
 - debugging application startup logs
 - monitoring deployments


## tail

Command Syntax:
tail <file-name>

Example:
tail day2-learning.md

Pronunciation:
tail

Meaning:
Display last 10 lines of file

Use:
Quickly previews latest file content

When to use:
When monitoring recent logs or latest file updates

Real DevOps Importance:
Used for:
 - monitoring live logs
 - debugging application failures
 - checking deployment outputs
 - viewing latest server events
 - production troubleshooting


## echo

Command Syntax:
echo <text>

Example:
echo Hello DevOps

Pronunciation:
echo

Meaning:
Display text output in terminal

Use:
Prints messages, variables or outputs

When to use:
When displaying terminal messages or generating file content

Real DevOps Importance:
Used for:
 - shell scripting
 - debugging scripts
 - generating logs
 - automation workflows
 - CI/CD scripting


## >

Command Syntax:
command > <file-name>

Example:
echo Hello > text.txt

Pronunciation:
greater than

Meaning:
Redirect command output by overwriting file contents

Use:
Stores command output inside files

When to use:
When generating files or saving command outputs

Real DevOps Importance:
Used for:
 - generating logs
 - storing automation outputs
 - creating configuration files
 - redirecting deployment outputs
 - shell scripting


## >>

Command Syntax:
command >> <file-name>

Example:
echo DevOps >> text.txt

Pronunciation:
double greater than

Meaning:
Append command output to existing file contents

Use:
Adds new output without deleting old content

When to use:
When preserving previous file contents while adding new data

Real DevOps Importance:
Used for:
 - appending logs
 - maintaining audit records
 - logging automation outputs
 - shell scripting
 - monitoring workflows


## cp

Command Syntax:
cp <source-file> <destination>

Example:
cp text.txt backup.txt

Pronunciation:
copy

Meaning:
Copy files/directories

Use:
Duplicates files or folders

When to use:
When creating backups or duplicating files

Real DevOps Importance:
Used for:
 - creating backups
 - duplicating configuration files
 - deployment preparation
 - infrastructure management
 - server migrations


## mv

Command Syntax:
mv <source> <destination>

Example:
mv backup.txt newbackup.txt

Pronunciation:
move

Meaning:
Move or rename files/directories

Use:
Transfers or renames filesystem objects

When to use:
When reorganizing files or renaming resources

Real DevOps Importance:
Used for:
 - renaming deployment files
 - moving logs
 - restructuring projects
 - release management
 - server maintenance


## rm

Command Syntax:
rm <file-name>

Example:
rm text.txt

Pronunciation:
remove

Meaning:
Delete files permanently

Use:
Removes files from filesystem

When to use:
When deleting unnecessary or temporary files

Real DevOps Importance:
Used for:
 - cleanup operations
 - removing temporary files
 - deleting failed artifacts
 - server maintenance
 - automation cleanup


## rmdir

Command Syntax:
rmdir <directory-name>

Example:
rmdir test1

Pronunciation:
remove directory

Meaning:
Delete empty directory permanently

Use:
Removes empty folders

When to use:
When cleaning unused empty directories

Real DevOps Importance:
Used for:
 - removing temporary directories
 - filesystem cleanup
 - infrastructure maintenance
 - automation cleanup
 - project restructuring


## history

Command Syntax:
history

Example:
history

Pronunciation:
history

Meaning:
Display previously executed terminal commands

Use:
Shows command execution history

When to use:
When reviewing or reusing previous commands

Real DevOps Importance:
Used for:
 - auditing commands
 - troubleshooting operations
 - reusing deployment commands
 - shell productivity
 - operational tracking


## grep

Command Syntax:
grep <keyword> <file-name>

Example:
grep command day2-learning.md

Pronunciation:
grep

Meaning:
Search matching text patterns inside files/output

Use:
Filters lines containing specified keyword

When to use:
When searching logs, files or command outputs

Real DevOps Importance:
Used for:
 - log analysis
 - troubleshooting applications
 - searching configuration files
 - debugging deployments
 - monitoring server outputs


## find

Command Syntax:
find <location> -name <file-name>

Example:
find . -name text.txt

Pronunciation:
find

Meaning:
Search files/directories in Linux filesystem

Use:
Locates files recursively inside directories

When to use:
When searching unknown file locations

Real DevOps Importance:
Used for:
 - locating configuration files
 - finding logs
 - searching deployment artifacts
 - infrastructure management
 - server troubleshooting


## wc

Command Syntax:
wc <file-name>

Example:
wc day2-learning.md

Pronunciation:
word count

Meaning:
Display line, word and character counts

Use:
Analyzes file statistics

When to use:
When checking file size or content statistics

Real DevOps Importance:
Used for:
 - log analysis
 - script validation
 - file statistics
 - automation reporting
 - monitoring generated outputs


## Pipe |

Symbol:
|

Example:
ls | wc -l

Pronunciation:
pipe

Meaning:
Pass output of one command as input to another command

Use:
Combines multiple Linux commands together

When to use:
When filtering or processing command outputs

Real DevOps Importance:
Used heavily in:
 - shell scripting
 - automation workflows
 - log analysis
 - command chaining
 - DevOps scripting


## Tab Auto-complete

Shortcut:
Tab

Example:
cd Do<Tab>

Pronunciation:
tab auto-complete

Meaning:
Automatically completes commands/files/directories

Use:
Reduces typing effort and command mistakes

When to use:
When working with long filenames, commands or paths

Real DevOps Importance:
Used for:
 - faster terminal navigation
 - reducing typing errors
 - improving shell productivity
 - handling complex paths
 - efficient Linux administration
