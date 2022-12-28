
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

### du - disk usage

measures the disk space occupied by files or directories. By default, it measures the current directory and all its subdirectories, printing totals in blocks for each, with a grand total at the bottom:

->du

-> du myfile emptyfile hugefile

### file

The file command reports the type of a file.

### Chattr and lsattr
[More](
https://www.linuxtechi.com/file-directory-attributes-in-linux-using-chattr-lsattr-command/)

-> find . -type f -name myfile\* -print

Print all dir names:

->find . -type d -print

For example, to search your current dir hierarchy for files containing the word "tomato":

-> find . -type f -print | xargs grep -l tomato

-> find . -type f -print0 | xargs -0 grep -l tomato

Match lines ending in an exclamation point:

-> grep '\!$' randomlines

### fgrep

Google it.

  -> cut -f3 -d, data.csv

### uniq

-> sort letters2 | uniq

Count adjacent duplicate lines.

-> sort letters2 | uniq -c

output: \
1 a \
3 b \
1 c 

### AWK

Print the second and fourth word on each line:


-> awk '{print $2, $4}' myfile


Print all lines that are shorter than 60 characters:

-> awk 'length < 60 {print}' myfile


### sed
sed 's/me/YOU/g' myfile

### rsync

-> rsync 0a mydir vasu@server.example.com:D2

### dd

google it.

### flock

google it.

### last

google it.

### printenv

Print list of env variables.


Created by @Vasu Patel, 

Let me know in case of any doubt or want to add more stuff into this. Enjoy!