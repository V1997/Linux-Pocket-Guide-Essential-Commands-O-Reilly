# 🐧 Linux Pocket Guide - Essential Commands

[![GitHub stars](https://img.shields.io/github/stars/V1997/Linux-Pocket-Guide-Essential-Commands-O-Reilly)](https://github.com/V1997/Linux-Pocket-Guide-Essential-Commands-O-Reilly/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](CONTRIBUTING.md)

This comprehensive guide is a collection of essential Linux commands, practical examples, and insights designed for beginners to intermediate users. Whether you're just starting your Linux journey or looking to strengthen your command-line skills, this guide provides clear explanations with real-world examples.

## 🚀 Quick Start

**New to Linux?** Start with our [Interactive Tutorial](examples/interactive_tutorial.sh):
```bash
chmod +x examples/interactive_tutorial.sh
./examples/interactive_tutorial.sh
```

**Need a quick reference?** Check out our [Cheat Sheet](CHEAT_SHEET.md) for the most commonly used commands.

**Want hands-on practice?** Run our [Practical Demo](examples/practical_demo.sh):
```bash
chmod +x examples/practical_demo.sh
./examples/practical_demo.sh
```

**Ready for exercises?** Try our [Practice Exercises](examples/practice_exercises.sh):
```bash
chmod +x examples/practice_exercises.sh
./examples/practice_exercises.sh
```

## 📚 Table of Contents

- [🔧 Basic Operations](#-basic-operations)
  - [Piping to Bash](#piping-to-bash)
  - [Command-Line Arguments](#command-line-arguments)
  - [Variables](#variables)
- [🔄 Control Structures](#-control-structures)
  - [Loops](#loops)
  - [Conditional Statements](#conditional-statements)
- [📁 File System](#-file-system)
  - [Whitespace and Line Breaks](#whitespace-and-line-breaks)
  - [File System Essentials](#file-system-essentials)
  - [File Permissions](#file-permissions)
- [🔍 Search & Filter](#-search--filter)
  - [Viewing File Content](#viewing-file-content)
  - [Searching and Filtering](#searching-and-filtering)
  - [Text Processing](#text-processing)
- [⚙️ System Operations](#️-system-operations)
  - [Command Chaining](#command-chaining)
  - [Process Management](#process-management)
  - [System Information](#system-information)
- [🎯 Advanced Topics](#-advanced-topics)
- [📖 Resources](#-resources)

## 💡 Learning Path

1. **Beginner**: Start with [Basic Operations](#-basic-operations) and [File System](#-file-system)
2. **Intermediate**: Move to [Search & Filter](#-search--filter) and [System Operations](#️-system-operations)
3. **Advanced**: Explore [Control Structures](#-control-structures) and [Advanced Topics](#-advanced-topics)

---

## 🔧 Basic Operations

### Piping to Bash
You can construct commands as strings and send them to Bash for execution:
```bash
# Display a command
echo wc -l myfile
# Execute the command by piping it to Bash
echo wc -l myfile | bash
```
**Output:**
```
18 myfile (Total number of lines in myfile)
```

**💡 Pro Tips:**
- Useful for dynamic command generation in scripts
- Be careful with user input to avoid command injection
- Consider using `eval` for more complex command construction

### Command-Line Arguments
```bash
# Example script (script-args)
echo "My name is $1 and I come from $2"
```
**Running the script:**
```bash
./script-args Vasu India
```
**Output:**
```
My name is Vasu and I come from India
```

**📝 Argument Variables:**
- `$0` - Script name
- `$1, $2, $3...` - Positional arguments
- `$#` - Number of arguments
- `$@` - All arguments as separate strings
- `$*` - All arguments as a single string

**Example with error checking:**
```bash
#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Usage: $0 <name> <location>"
    exit 1
fi
echo "Hello $1 from $2!"
```

### Variables
#### While Loop
```bash
#!/bin/bash
i=0
while [ $i -lt 3 ]
do
  echo "$i"
  i=$((i + 1))
done
```
**Output:**
```
0
1
2
```

#### Until Loop
```bash
#!/bin/bash
i=0
until [ $i -ge 3 ]
do
  echo "$i"
  i=$((i + 1))
done
```

#### For Loop
```bash
#!/bin/bash
for name in Tom Jane Harry
do
  echo "$name is my friend"
done
```
**Output:**
```
Tom is my friend
Jane is my friend
Harry is my friend
```

**🔄 Advanced Loop Examples:**
```bash
# C-style for loop
for ((i=1; i<=5; i++)); do
    echo "Number: $i"
done

# Loop through files
for file in *.txt; do
    echo "Processing: $file"
done

# Loop with range
for i in {1..10}; do
    echo "Count: $i"
done

# Break and continue
for i in {1..10}; do
    [ $i -eq 5 ] && continue
    [ $i -eq 8 ] && break
    echo $i
done
```

### Conditional Statements
```bash
# If-else statement
if [ "$USER" = "root" ]; then
    echo "You are the root user"
elif [ -n "$USER" ]; then
    echo "You are: $USER"
else
    echo "Unknown user"
fi

# Case statement
case "$1" in
    start)
        echo "Starting service..."
        ;;
    stop)
        echo "Stopping service..."
        ;;
    restart)
        echo "Restarting service..."
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac
```

**🧪 Test Conditions:**
- `-f file` - File exists and is regular file
- `-d dir` - Directory exists
- `-r file` - File is readable
- `-w file` - File is writable
- `-x file` - File is executable
- `-z string` - String is empty
- `-n string` - String is not empty

---

## 📁 File System

### Whitespace and Line Breaks
```bash
# Basic variable assignment
MYVAR=6
echo $MYVAR  # or echo ${MYVAR}
```
**Output:**
```
6
```

**🔍 Variable Types & Usage:**
```bash
# String variables
NAME="John Doe"
echo "Hello, $NAME"

# Environment variables
export PATH="/usr/local/bin:$PATH"

# Command substitution
CURRENT_DATE=$(date)
FILES_COUNT=`ls | wc -l`

# Array variables (Bash 4+)
FRUITS=("apple" "banana" "orange")
echo ${FRUITS[0]}  # First element
echo ${FRUITS[@]}  # All elements
```

**🛡️ Variable Best Practices:**
- Use `${VAR}` for clarity in complex expressions
- Quote variables: `"$VAR"` to handle spaces
- Use `readonly` for constants: `readonly PI=3.14159`

[📖 More on Variables](https://www.networkworld.com/article/3387154/working-with-variables-on-linux.html)

---

## 🔄 Control Structures

### Loops
Bash is sensitive to whitespace and line breaks. Separate arguments with spaces:
```bash
grep abcdefghijklmnopqrstuvwxyz file1 file2 file3 file4
```

**⚠️ Common Whitespace Issues:**
```bash
# WRONG - no spaces around =
VAR = "value"

# CORRECT - no spaces around =
VAR="value"

# WRONG - missing quotes with spaces
file=my file.txt

# CORRECT - quoted to handle spaces
file="my file.txt"
```

### File System Essentials
**📂 Key Directories:**
- **/bin** - Essential user binaries (commands like ls, cp, mv)
- **/sbin** - System binaries ([More](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s16.html))
- **/usr/bin** - User utilities and applications
- **/etc** - Configuration files
- **/home** - User home directories
- **/var** - Variable data (logs, temporary files)
- **/tmp** - Temporary files
- **/proc** - Virtual filesystem with system runtime info ([More](https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/proc.html))
- **/dev** - Device files
- **/mnt** - Mount point for temporary filesystems

**🗂️ File Operations:**
```bash
# Navigation
pwd                    # Print working directory
cd /path/to/directory  # Change directory
cd ~                   # Go to home directory
cd -                   # Go to previous directory

# File manipulation
touch file.txt         # Create empty file
cp source dest         # Copy file
mv old_name new_name   # Move/rename
rm file.txt           # Delete file
rm -rf directory      # Delete directory recursively

# Directory operations
mkdir directory        # Create directory
mkdir -p path/to/dir   # Create nested directories
rmdir directory        # Remove empty directory
```

### File Permissions
**🔐 Permission System:**

| Permission | Symbol | Numeric | Meaning |
|------------|--------|---------|---------|
| Read (R)   | r      | 4       | Can view file content |
| Write (W)  | w      | 2       | Can modify file |
| Execute (X)| x      | 1       | Can run file as program |

**👥 Permission Groups:**
- **Owner (u)** - File owner
- **Group (g)** - File group members  
- **Others (o)** - All other users

**📊 Common Permission Combinations:**
```bash
755  # rwxr-xr-x  Owner: read/write/execute, Group/Others: read/execute
644  # rw-r--r--  Owner: read/write, Group/Others: read only
600  # rw-------  Owner: read/write, Group/Others: no access
777  # rwxrwxrwx  Everyone: full access (be careful!)
```

**🛠️ Permission Commands:**
```bash
# View permissions
ls -l file.txt

# Change permissions (numeric)
chmod 755 script.sh
chmod 644 document.txt

# Change permissions (symbolic)
chmod +x script.sh        # Add execute permission
chmod u+w file.txt        # Add write for owner
chmod g-r file.txt        # Remove read for group
chmod o=r file.txt        # Set others to read only

# Change ownership
chown user:group file.txt  # Change owner and group
chown user file.txt        # Change owner only
chgrp group file.txt       # Change group only
```

---

## 🔍 Search & Filter

### Viewing File Content
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

```bash
# Basic background execution
emacs myfile &                          # Run editor in background
sleep 100 &                             # Run sleep in background

# Job control
jobs                                     # List background jobs
fg %1                                    # Bring job 1 to foreground
bg %1                                    # Send job 1 to background
kill %1                                  # Kill job 1
disown %1                               # Remove job from shell's job table

# Persistent background processes
nohup long_running_command &             # Continue after logout
screen -S session_name                   # Create detachable session
tmux new-session -s session_name         # Create tmux session
```

### Process Management
```bash
# View processes
ps aux                     # List all running processes
ps -ef                     # Alternative process view
top                        # Real-time process monitor
htop                       # Enhanced process monitor (if installed)
pgrep process_name         # Find process IDs by name
pidof process_name         # Get PID of running process

# Control processes
kill PID                   # Terminate process by ID
killall process_name       # Kill all processes by name
kill -9 PID               # Force kill process
kill -STOP PID            # Pause process
kill -CONT PID            # Resume paused process

# System monitoring
uptime                     # System uptime and load
free -h                    # Memory usage (human readable)
df -h                      # Disk space usage
du -sh directory           # Directory size
iostat                     # I/O statistics
netstat -tulpn            # Network connections
ss -tulpn                 # Modern replacement for netstat
```

### System Information

```bash
# Basic file viewing
cat file.txt              # Display entire file
less file.txt             # View file with pagination (q to quit)
more file.txt             # Similar to less, less features
head file.txt             # Show first 10 lines
head -n 5 file.txt        # Show first 5 lines
tail file.txt             # Show last 10 lines
tail -n 20 file.txt       # Show last 20 lines
tail -f logfile.txt       # Follow file changes (real-time)

# File analysis
wc file.txt               # Count lines, words, characters
wc -l file.txt            # Count lines only
wc -w file.txt            # Count words only
wc -c file.txt            # Count characters only
nl file.txt               # Number lines in output
file document.pdf         # Identify file type

# Multiple files
cat file1.txt file2.txt   # Concatenate multiple files
cat *.txt | wc            # Count all .txt files combined
```

**📱 Practical Examples:**
```bash
# Monitor log files in real-time
tail -f /var/log/syslog

# Show file with line numbers
cat -n script.sh

# Display non-printing characters
cat -A file.txt

# Compare files
diff file1.txt file2.txt
```

### Searching and Filtering
**🔍 Find Files:**
```bash
# Basic find operations
find . -name "*.txt"                    # Find .txt files
find . -type f -name "myfile*"          # Find regular files starting with "myfile"
find . -type d                          # Find directories only
find /home -user john                   # Find files owned by john
find . -size +100M                      # Find files larger than 100MB
find . -mtime -7                        # Find files modified in last 7 days
find . -empty                           # Find empty files and directories

# Advanced find with actions
find . -name "*.log" -delete            # Find and delete .log files
find . -name "*.txt" -exec wc -l {} \;  # Count lines in each .txt file
find . -type f -print | xargs grep -l "pattern"  # Find files containing pattern
```

**🔎 Text Search with grep:**
```bash
# Basic grep usage
grep "pattern" file.txt                 # Search for pattern in file
grep -i "pattern" file.txt              # Case-insensitive search
grep -r "pattern" directory/            # Recursive search in directory
grep -n "pattern" file.txt              # Show line numbers
grep -v "pattern" file.txt              # Show lines NOT containing pattern
grep -c "pattern" file.txt              # Count matching lines

# Advanced grep
grep -E "pattern1|pattern2" file.txt    # Multiple patterns (extended regex)
grep -A 3 -B 2 "pattern" file.txt       # Show 3 lines after, 2 before match
grep -l "pattern" *.txt                 # Show only filenames with matches
grep "^start" file.txt                  # Lines starting with "start"
grep "end$" file.txt                    # Lines ending with "end"
grep "\!$" randomlines                  # Lines ending with '!' (escape special chars)
```

### Text Processing
```bash
# Sort and unique
sort file.txt                           # Sort lines alphabetically
sort -n numbers.txt                     # Sort numerically
sort -r file.txt                        # Reverse sort
uniq file.txt                           # Remove duplicate adjacent lines
sort file.txt | uniq                    # Sort then remove duplicates

# Cut and extract
cut -d: -f1 /etc/passwd                 # Extract first field (delimiter :)
cut -c1-10 file.txt                     # Extract characters 1-10
awk '{print $1}' file.txt               # Print first column
sed 's/old/new/g' file.txt              # Replace all "old" with "new"

# Advanced text processing
tr 'a-z' 'A-Z' < file.txt               # Convert to uppercase
paste file1.txt file2.txt               # Merge files side by side
join file1.txt file2.txt                # Join files on common field
```

**💡 Real-world Examples:**
```bash
# Extract usernames from system
cut -d: -f1 /etc/passwd | sort

# Find large files in home directory
find ~ -type f -size +100M | head -10

# Count unique IP addresses in log
awk '{print $1}' access.log | sort | uniq -c | sort -nr

# Find files modified today
find . -type f -newermt $(date +%Y-%m-%d)
```

---

## ⚙️ System Operations

### Command Chaining
```bash
# System information
uname -a                   # Complete system information
hostname                   # System hostname
whoami                     # Current username
id                         # User and group IDs
groups                     # User's groups
date                       # Current date and time
uptime                     # System uptime and load averages
lscpu                      # CPU information
lsmem                      # Memory information
lsblk                      # Block device information
lsusb                      # USB device information
lspci                      # PCI device information

# File and directory statistics
stat file.txt              # Detailed file information
file document.pdf          # Identify file type
du -sh directory           # Directory size
df -h                      # Filesystem disk space usage
mount                      # Show mounted filesystems
lsof                       # List open files
which command              # Locate command executable
whereis command            # Locate command, source, manual

# Command history
history                    # Show command history
history 10                 # Show last 10 commands
!!                         # Repeat last command
!n                         # Repeat command number n
!string                    # Repeat last command starting with string
```

**💻 Practical System Examples:**
```bash
# Check system resources
free -h && df -h && uptime

# Find what's using disk space
du -sh /var/log/* | sort -hr

# Monitor real-time system activity
watch -n 1 'free -h; df -h'

# Find which process is using a file
lsof /path/to/file

# Check network connectivity
ping -c 4 google.com && echo "Internet is working"
```

---

## 🎯 Advanced Topics

### Input/Output Redirection
```bash
# Redirect output
command > file.txt         # Redirect stdout to file (overwrite)
command >> file.txt        # Redirect stdout to file (append)
command 2> error.log       # Redirect stderr to file
command &> all.log         # Redirect both stdout and stderr
command > /dev/null        # Discard output

# Redirect input
command < input.txt        # Use file as input
command << EOF             # Here document
This is input
EOF

# Pipes
command1 | command2        # Pipe output of command1 to command2
command | tee file.txt     # Save output to file AND display it
```

### Environment Variables
```bash
# View environment
env                        # Show all environment variables
echo $PATH                 # Show PATH variable
echo $HOME                 # Show home directory
printenv USER              # Show specific variable

# Set environment variables
export MYVAR="value"       # Set and export variable
unset MYVAR               # Remove variable
PATH="/new/path:$PATH"     # Modify PATH

# Make permanent (add to ~/.bashrc or ~/.profile)
echo 'export MYVAR="value"' >> ~/.bashrc
```

### Archives and Compression
```bash
# tar archives
tar -czf archive.tar.gz files/     # Create compressed tar archive
tar -xzf archive.tar.gz            # Extract compressed tar archive
tar -tzf archive.tar.gz            # List contents without extracting
tar -czf backup-$(date +%Y%m%d).tar.gz ~/documents/

# zip archives
zip -r archive.zip files/          # Create zip archive
unzip archive.zip                  # Extract zip archive
unzip -l archive.zip               # List zip contents

# Other compression tools
gzip file.txt                      # Compress file (creates file.txt.gz)
gunzip file.txt.gz                 # Decompress file
```

### Networking Commands
```bash
# Network connectivity
ping hostname                      # Test connectivity
traceroute hostname                # Trace network path
nslookup domain.com               # DNS lookup
dig domain.com                    # Advanced DNS lookup

# Download files
wget https://example.com/file.zip  # Download file
curl -O https://example.com/file   # Download with curl
curl -L url                       # Follow redirects
rsync -av source/ destination/    # Sync directories

# Network monitoring
netstat -an                       # Network connections
ss -tuln                          # Socket statistics
iftop                            # Network usage by connection
```

---

## 📖 Resources

### 🎓 Learning Resources
- **Official Documentation**
  - [GNU Bash Manual](https://www.gnu.org/software/bash/manual/)
  - [Linux Documentation Project](https://tldp.org/)
  - [Linux Filesystem Hierarchy Standard](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html)

- **Interactive Learning**
  - [OverTheWire Bandit](https://overthewire.org/wargames/bandit/) - Linux command line challenges
  - [Explainshell](https://explainshell.com/) - Breakdown any shell command
  - [Command Line Challenge](https://cmdchallenge.com/) - Practice exercises

- **Reference Guides**
  - [Linux Proc by JavaTPoint](https://www.javatpoint.com/linux-proc)
  - [File Attributes with chattr & lsattr](https://www.linuxtechi.com/file-directory-attributes-in-linux-using-chattr-lsattr-command/)
  - [Advanced Bash Scripting Guide](https://tldp.org/LDP/abs/html/)

### 🛠️ Tools and Extensions
- **Terminal Enhancers**
  - [Oh My Zsh](https://ohmyz.sh/) - Zsh framework with plugins
  - [Fish Shell](https://fishshell.com/) - Smart and user-friendly shell
  - [Starship](https://starship.rs/) - Cross-shell prompt

- **Useful Utilities**
  - `htop` - Enhanced process viewer
  - `tree` - Directory tree visualization
  - `ncdu` - Disk usage analyzer
  - `fd` - Fast alternative to find
  - `ripgrep` - Fast grep alternative

### 🤝 Contributing
We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details on how to:
- Report bugs or suggest improvements
- Add new command examples
- Improve documentation
- Share your Linux tips and tricks

### 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### 🙋‍♂️ Getting Help
- **Issues**: Open an issue on GitHub for bugs or questions
- **Discussions**: Use GitHub Discussions for general questions
- **Community**: Join Linux communities on Reddit, Discord, or Stack Overflow

---

## 🎉 Final Notes

**Remember**: The best way to learn Linux commands is through practice! 

1. **Start Small**: Begin with basic file operations
2. **Practice Daily**: Use the command line for everyday tasks
3. **Read Manual Pages**: Use `man command` to learn more about any command
4. **Experiment Safely**: Practice in a virtual machine or safe environment
5. **Build Gradually**: Combine simple commands to create powerful workflows

**Quick Tip**: Use `command --help` or `man command` to get detailed information about any command!

🚀 **Happy Linux-ing!** 🐧

