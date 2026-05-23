# Day 2 Linux Learning

## pwd

Command Syntax:
pwd

Example:
pwd

Pronunciation:
pee-double-you-dee

Meaning:
Print Working Directory

Use:
Shows current location in Linux filesystem

When to use:
When I need to verify my current location before executing filesystem commands


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
Shows files and folders inside current directory

When to use:
When I need to inspect files and folders inside a directory


## ls -l

Command Syntax:
ls -l

Example:
ls -l

Pronunciation:
ell-ess dash ell

Meaning:
Long listing format

Use:
Shows detailed information like permissions, owner, size and timestamps

When to use:
When detailed file information like permissions, owner or file size is needed


## ls -la

Command Syntax:
ls -la

Example:
ls -la

Pronunciation:
ell-ess dash ell-ay

Meaning:
Long listing including hidden files

Use:
Shows hidden files/directories along with detailed information

When to use:
When hidden files/directories also need inspection


## cd ..

Command Syntax:
cd ..

Example:
cd ..

Pronunciation:
see-dee dot dot

Meaning:
Move one level upward to parent directory

Use:
Navigate back/up in Linux filesystem

When to use:
When navigating upward in filesystem hierarchy


## cd <directory-name>

Command Syntax:
cd <directory-name>

Example:
cd Day2

Pronunciation:
see-dee directory-name

Meaning:
Change current directory

Use:
Move into a specific folder/directory

When to use:
When switching into another working directory


## mkdir

Command Syntax:
mkdir <directory-name>

Example:
mkdir Day2

Pronunciation:
make-dir

Meaning:
Make directory

Use:
Create new folder/directory

When to use:
When creating project folders, workspaces or directory structures


## touch

Command Syntax:
touch <file-name>

Example:
touch text.txt

Pronunciation:
tuch

Meaning:
Create empty file or update timestamp

Use:
Create new empty file

When to use:
When creating new files quickly from terminal


## cat

Command Syntax:
cat <file-name>

Example:
cat text.txt

Pronunciation:
kat

Meaning:
Concatenate and display file contents

Use:
Read/display contents of a file

When to use:
When inspecting small text files directly in terminal


## >

Command Syntax:
command > <file-name>

Example:
echo "Hello DevOps" > text.txt

Pronunciation:
greater-than / redirect

Meaning:
Output redirection operator

Use:
Write command output into a file by overwriting existing contents

When to use:
When command output needs to overwrite contents of a file


## >>

Command Syntax:
command >> <file-name>

Example:
echo "Hello DevOps" >> text.txt

Pronunciation:
double-greater-than / append redirect

Meaning:
Append output redirection operator

Use:
Append command output at the end of a file without deleting old content

When to use:
When new output needs to be appended without deleting existing contents


## Clearing File Contents Without Deleting File

Command Syntax:
> <file-name>

Example:
> day2-learning.md

Pronunciation:
greater-than file-name

Meaning:
Overwrite file with empty output

Use:
Clear contents of a file without deleting the file itself

When to use:
When logs or temporary files need resetting while keeping the file present


## cp

Command Syntax:
cp <source-file> <destination-file>

Example:
cp text.txt backup.txt

Pronunciation:
see-pee

Meaning:
Copy files/directories

Use:
Create duplicate copy of a file or directory

When to use:
When backup or duplicate copies of files/directories are needed


## mv

Command Syntax:
mv <old-name> <new-name>

Example:
mv backup.txt notes.txt

Pronunciation:
em-vee

Meaning:
Move or rename files/directories

Use:
Rename or move files/directories

When to use:
When files/directories need renaming or relocation


## rm

Command Syntax:
rm <file-name>

Example:
rm notes.txt

Pronunciation:
are-em

Meaning:
Remove/delete files

Use:
Permanently delete files

When to use:
When unnecessary files need permanent deletion


## clear

Command Syntax:
clear

Example:
clear

Pronunciation:
kleer

Meaning:
Clear terminal screen

Use:
Clears visible terminal output for better readability

When to use:
When terminal output becomes cluttered during long sessions or debugging


## history

Command Syntax:
history

Example:
history

Pronunciation:
his-tree

Meaning:
Display command history

Use:
Shows previously executed terminal commands

When to use:
When previously executed commands need inspection or reuse


## history -c

Command Syntax:
history -c

Example:
history -c

Pronunciation:
his-tree dash see

Meaning:
Clear command history

Use:
Deletes stored command history records

When to use:
When command history records need removal/reset


## less

Command Syntax:
less <file-name>

Example:
less day2-learning.md

Pronunciation:
less

Meaning:
Interactive file viewer

Use:
Allows scrolling and controlled viewing of large files

When to use:
When reading large logs, configs or files interactively


## head

Command Syntax:
head <file-name>

Example:
head day2-learning.md

Pronunciation:
hed

Meaning:
Display beginning of file

Use:
Shows first 10 lines of file by default

When to use:
When inspecting beginning/header portion of large files


## tail

Command Syntax:
tail <file-name>

Example:
tail day2-learning.md

Pronunciation:
tayl

Meaning:
Display end of file

Use:
Shows last 10 lines of file by default

When to use:
When inspecting latest entries or end portion of logs/files


## wc

Command Syntax:
wc <file-name>

Example:
wc day2-learning.md

Pronunciation:
double-you-see

Meaning:
Word count utility

Use:
Counts lines, words and characters in file

When to use:
When file statistics like line, word or character counts are needed


## grep

Command Syntax:
grep <pattern> <file-name>

Example:
grep "command" day2-learning.md

Pronunciation:
grep

Meaning:
Search text patterns

Use:
Searches matching text lines inside files

When to use:
When searching logs, configs or files for specific text patterns


## grep -i

Command Syntax:
grep -i <pattern> <file-name>

Example:
grep -i "meaning" day2-learning.md

Pronunciation:
grep dash eye

Meaning:
Case-insensitive text search

Use:
Searches text while ignoring uppercase/lowercase differences

When to use:
When text search should ignore capitalization differences


## |

Command Syntax:
command1 | command2

Example:
history | less

Pronunciation:
pipe

Meaning:
Pipe operator

Use:
Sends output of one command as input to another command

When to use:
When output from one command needs processing by another command


## find

Command Syntax:
find <location> -name <file-name>

Example:
find . -name "text.txt"

Pronunciation:
faynd

Meaning:
Search filesystem

Use:
Searches files/directories recursively

When to use:
When file/directory names are known but locations are unknown


## ls | wc -l

Command Syntax:
ls | wc -l

Example:
ls | wc -l

Pronunciation:
ell-ess pipe double-you-see dash ell

Meaning:
Count directory entries

Use:
Counts number of files/directories returned by ls

When to use:
When counting number of files/directories inside a location


## rmdir

Command Syntax:
rmdir <directory-name>

Example:
rmdir test1

Pronunciation:
are-em-dee-eye-ar

Meaning:
Remove empty directory

Use:
Deletes empty folders/directories

When to use:
When empty directories need cleanup/removal


## man

Command Syntax:
man <command>

Example:
man ls

Pronunciation:
man

Meaning:
Manual/documentation viewer

Use:
Displays documentation/help for Linux commands

When to use:
When command syntax, options or documentation need reference


## TAB Autocomplete

Command Syntax:
Press TAB while typing command/file/directory

Example:
cat day + TAB

Pronunciation:
tab auto-complete

Meaning:
Automatic command/file completion

Use:
Completes commands/files/directories automatically

When to use:
When working with long filenames, file paths, Docker containers, Kubernetes pods or complex commands
