
# Linux-Pocket-Guide-Essential-Commands-O-Reilly

This is not a comprehensive Linux material instead you will get detailed information of various commands, hacks and some insights. Enjoy!

------

### Piping to Bash
### Bash 
You can construct commands as strings and send them to bash for executions:
```
→ echo wc -l myfile
wc -l myfile

→ echo wc -l myfile | bash
18 myfile            (Total number of rows used in a text file)
```
### Command-Line Arguments
```
→ cat script-args
My name is $1 and I come from $2

→./script-args Vasu India
My name is Vasu and I come from India
```
### Loops
```
→ cat script-while
#!/bin/bash
i=0
while [ $i -lt 3 ]    
do 
    echo "$i"
    i=`expr $i + 1`
done
--------------
-lt ( means Less than )
-------------
→ ./script-while
0
1
2
The until loop repeats until a condition becomes true:
until command While the exit status of command is nonzero
do
 body
done
For example:
→ cat script-until
#!/bin/bash
i=0
until [ $i -ge 3 ]
do
 echo "$i"
 i=`expr $i + 1`
done

→ ./script-until
i=1
while [ $i -lt 10 ] Variable i never changes. Infinite!
do
 echo "forever"
done
```

Another type of loop, the for loop, iterates over values from a list: \
for variable in list \
do \
&nbsp; &nbsp;&nbsp; body \
done

```
→ cat script-for
#!/bin/bash

for name in Tom Jane Harry
do
  echo "$name is my friend"
done

→ ./script-for
Tom is my friend
Jane is my friend
Harry is my friend
```
### Varibles
→ MYVAR=6 \
→ echo $MYVAR
6 \

For more: https://www.networkworld.com/article/3387154/working-with-variables-on-linux.html

### Whitespace and Linebreaks
Bash shell scripts are very sensitive to whitespace and line‐
breaks. Because the “keywords” of this programming language
are actually commands evaluated by the shell, you need to sep‐arate arguments with whitespace. \

For example:
```
→ grep abcdefghijklmnopqrstuvwxyz file1 file2 \
 file3 file4
```
### Creating and Running Shell Scripts

#!/bin/bash


!["The diffference betweeen a shell window and the shell"](Images\shell.PNG?raw=true "The diffference betweeen a shell window and the shell")

[SBIN - System binaries](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s16.html#:~:text=1.,to%20the%20binaries%20in%20%2Fbin%20)

/etc - et cetera - Configuration files for the system(and other miscellaneous stuff)

/etc/init.d - Configuration files for booting Linux

/etc/rc.d - Configuration files for booting Linux; rc1.d, rc2.d,...

/proc (process information pseudo-file system) - 
It doesn't contain 'real' files but runtime system information (e.g. system memory, devices mounted, hardware configuration, etc).
[More](
https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/proc.html)

[Linux Proc by JavaTPoint](https://www.javatpoint.com/linux-proc)

Read(R) Write(W) Execute(X)  \
  4              2           1 \
2^2         2^1       2^0

-> any command > outfile   (create/override file) \
-> any command >> outfile (Append to outfile)

Print first column of the output.
-> who | sort | awk '{print $1}' | less

-> ls *.jpg | cut -d. -f1 

For Instance: we have a file named *Image.jpg*

Let say we want to extract *Image* name from the *Image.jpg*

so we are going to write this way: 

ls Image.jpg | cut -d. -f1 | cat

-d = delimeter \
-f1 means first text before period(.), --- Image \
-f2 mean second text post period(.) --- jpg

To invoke several commands in sequence on a snigle command line, seperate them with semicolons:

-> *command1* ; *command2* ; *command3*

For example: -> who ; cat myfile ;

To run a sequence of commands as before, but stop execution if any of them fails, seperate them with && ("and") symbols:

-> *command1* && *command2* && *command3*

To run a sequence of commands, stopping executionor as soon as one succeeds, seperate them with || ("or") symbols:

-> *command1* || *command2* || *command3*

For Instance: \
-> who || cat myfile \
*Output:* vasu     tty2         2022-12-27 12:18 (tty2)

date +%Y

\+ - Represents format of the date
% - Define specific date, time, year

### Recall command - History

history - Print your history

history 5 - 5th command from your history

### &

Place at the end of a command line, the ampersand causes the given command to run as a background job:

-> emacs myfile &

ls -F \
list files with decorates like for dir /, "*" executables
, "@" symbolic link etc...

Cat is particularly useful for sending a set of files into a shell pipeline:

-> cat myfile* | wc

For instance, less will display the contents of a compressed ZIP file:


-> less myfile.zip


#### nl

nl copies its files to standard output, prepending line numbers:


-> nl poem

-> nl myfile


It's more flexible than cat with its -n and -b options, providing greater control over the numbering.

### HEAD

-> head myfile
-> head myfile* | less

Previewing the first few lines of output from a pipeline:

-> ls -lta | head

### Strings

Used for reading binary files.


-> strings /usr/bin/who


### STAT

The stat command lists important attributes of files (by default) or filesystems (-f option). file information looks like.

-> stat -f myfile



-------------------------

To watch the processes running on the computer.
-> top -d1

Print names and addresses of computers, on your default printer if you have one setup:
/etc/hosts/
-> lpr /etc/hosts

To check how long have you been logged in:
-> last -1 $USER
Universal Example: last -num $USER or last -num $user

To manifest information about your computer's IP address:
-> ip addr show eth0

To check who owns domain or website:
-> whois website.com | less

Finally, to clear the window:
-> clear

ls full form - list

ls [options] [files]

If you see a vertical bar between options or arguments, perhaps grouped by parentheses:

ls (file | directory)

this indicates choice: you may supply either a filename or directory name as an argument.

ls stdin stdout -file --opt --help --version

stdin (standard input) – your keyboard input
stdout (standard output) – your screen which displays output.

To give name and utilize dash[filename] or -vasu.txt then use ./ to create, edit and watever operations to perform.

-> touch ./-vasu
-> wc ./-vasu
output: 0 0 0 ./-vasu

--help
--version

echo command:

-> echo This is a long command that doesn’t fit on \
one line [Enter]
output: This is a long command that doesn’t fit on one line

Manual pages called manpages a command derived man from it.

-> man wc (means manual for wc command)
To search in manual for a command:
-> man -k database | less (here -k is option followed by the keyword, less is for printing the results one screenful at a time.)

info command:
-> info ls

For shorthelp:

-> wc --help

If the output is longer than the screen, pipe it into the less program to display it in pages. (press q to quite)”
-> ls –help | less

The kernel
The low-level OS handling files, disks, net-working, and other necessities we take for granted. Most users rarely notice the kernel.

To see the ownership and permissions of a directory:
-> ls -ld mydir

File permissions
chown (change owner), chgrp(change group), chmod(change mode)
- = file
d = directory

Permission understanding:
[-] [rwx] [r-x] [---]

[-] --- represent file or folder
[rwx] --- Represents owner’s rights -> chown (change owner)
[r-x] --- Represents group’s rights -> chgrp(change group)
[---] --- Represents otherusers rights. -> chgrp(change group)

to check Who is logged into the system:
-> who
. (period) – files with . Name included are hidden files. To list such files, -a being used. It means ALL.
Below command is for listing down all the environment variables.
-> Printenv
To add extra in existing path variable:
PATH=$PATH:/TEST/TEST/TEST
We will be having .profile file instead of .bash_profile in ubuntu
as a start up file.
List commands:
-> ls -alf
-> ls -l
-> ls -a
-> type ll
output: ll is aliased to `ls -alF'
-> alias ll
Output: alias ll='ls -alF'
who | sort (Input send to sort program and list alphabetically)
who | sort | awk ‘{print $1}’ | less


Compare files with its corresponding to a txt file.
-> ls *.jpg | cut -d. -f1 > /tmp/tes1
-> ls *.jpg | cut -d. -f1 > /tmp/test2
diff /tmp/test1 /tmp/test2
You can perform via single command as well.
-> diff <(ls *.jpg|cut -d. -f1) < (ls *.txt | cut -d. -f1)
Combining Commands:
command1 ; command2 ; command 3
To run a seq of commands as before but stop execution if any of them fails, seperate them with && (“and”) symbols:
-> command1 && command2 && command3


To run a sequence of commands, stopping execution as soon as one succeeds, seperate them with || (“or”) Symbols:
-> command1 || command2 || command3
Single or double quotes to make the shell treat it as a unit. Single quotes treat their contents literally, while double quotes let shell constructs be evaluated, such as
-> echo ‘test $HOME’
test $HOME
-> echo “test $HOME”
test /home/vasu
-> date +%Y (Print current year)
-> echo Next year is $(expr $(date +%Y) + 1)
Next year is 2017
-> echo a*
-> echo a\*
-> history
To run previous command: !!
Want to return to original shell:
-> sudo bash
copy multiple files into a sigle directory:
-> cp myfile myfile1 myfile2 mydir
Using the -a or -r option, you can also recursively copy directories.
Mv file1 dir1 destination_dir
Likewise, lots of files and folders can be moved to destination_dir.
rm -r dir1 dir2
Stat - display attributes of file and directories.

Du - measure disk usage of files and directories.
File - Identify the type of a file.
umask - (UNIX shorthand for "user file-creation mode mask)





