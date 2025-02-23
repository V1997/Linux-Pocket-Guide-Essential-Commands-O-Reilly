# Linux Pocket Guide - Essential Commands

This guide is a collection of useful Linux commands, tricks, and insights. It is not a comprehensive Linux manual but serves as a handy reference for essential operations. Enjoy!

---

## 📌 Piping to Bash
You can construct commands as strings and send them to Bash for execution:
```bash
# Display a command
echo wc -l myfile
# Execute the command by piping it to Bash
echo wc -l myfile | bash
```
Output:
```
18 myfile (Total number of lines in myfile)
```

## 📌 Command-Line Arguments
```bash
# Example script (script-args)
echo "My name is $1 and I come from $2"
```
Running the script:
```bash
./script-args Vasu India
```
Output:
```
My name is Vasu and I come from India
```

## 📌 Loops
### While Loop
```bash
#!/bin/bash
i=0
while [ $i -lt 3 ]
do
  echo "$i"
  i=$((i + 1))
done
```
Output:
```
0
1
2
```

### Until Loop
```bash
#!/bin/bash
i=0
until [ $i -ge 3 ]
do
  echo "$i"
  i=$((i + 1))
done
```

### For Loop
```bash
#!/bin/bash
for name in Tom Jane Harry
do
  echo "$name is my friend"
done
```
Output:
```
Tom is my friend
Jane is my friend
Harry is my friend
```

## 📌 Variables
```bash
MYVAR=6
echo $MYVAR
```
Output:
```
6
```
[More on Variables](https://www.networkworld.com/article/3387154/working-with-variables-on-linux.html)

## 📌 Whitespace and Line Breaks
Bash is sensitive to whitespace and line breaks. Separate arguments with spaces:
```bash
grep abcdefghijklmnopqrstuvwxyz file1 file2 file3 file4
```

## 📌 File System Essentials
- **/sbin** - System binaries ([More](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s16.html))
- **/etc** - Configuration files
- **/proc** - Virtual filesystem with system runtime info ([More](https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/proc.html))

## 📌 File Permissions
| Read (R) | Write (W) | Execute (X) |
|----------|----------|------------|
| 4        | 2        | 1          |
| 2^2      | 2^1      | 2^0        |

## 📌 Command Chaining
```bash
# Execute sequentially
command1 ; command2 ; command3

# Stop execution if any command fails
command1 && command2 && command3

# Stop execution as soon as one command succeeds
command1 || command2 || command3
```

## 📌 Useful Commands
```bash
# Extract first column of output
who | sort | awk '{print $1}' | less

# Extract filename without extension
ls Image.jpg | cut -d. -f1
```

## 📌 Running Commands in Background
```bash
emacs myfile &
```

## 📌 Viewing File Content
```bash
cat myfile* | wc        # Count lines, words, and bytes in files
less myfile.zip         # View contents of a ZIP file
nl poem                 # Number lines in a file
head myfile             # View the first few lines
```

## 📌 Searching and Filtering
```bash
find . -type f -name 'myfile*' -print   # Find files
find . -type d -print                   # Print directory names
find . -type f -print | xargs grep -l tomato  # Find files containing 'tomato'
grep '\!$' randomlines                  # Match lines ending with '!'
```

## 📌 Miscellaneous Commands
```bash
stat -f myfile      # File statistics
du                 # Disk usage
file myfile        # Identify file type
history           # Show command history
history 5         # Show the last 5 commands
```

---

For a deeper dive into Linux, explore:
- [Linux Proc by JavaTPoint](https://www.javatpoint.com/linux-proc)
- [File Attributes with chattr & lsattr](https://www.linuxtechi.com/file-directory-attributes-in-linux-using-chattr-lsattr-command/)

🚀 Happy Linux-ing!

