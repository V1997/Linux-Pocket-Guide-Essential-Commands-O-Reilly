# Advanced Linux Commands and Tips

This document contains advanced Linux commands and techniques for power users.

## 🚀 Advanced Command Line Techniques

### Process Management

#### Advanced Process Control
```bash
# Process monitoring
ps aux --sort=-%cpu | head -10        # Top CPU consuming processes
ps aux --sort=-%mem | head -10        # Top memory consuming processes
pstree                                # Show process tree
pidstat -u 2 5                       # CPU usage statistics every 2 seconds

# Job control
ctrl+z                                # Suspend current process
jobs -l                               # List jobs with PIDs
bg %1                                 # Resume job 1 in background
fg %2                                 # Bring job 2 to foreground
nohup command > output.log 2>&1 &     # Run command immune to hangups
```

#### System Monitoring
```bash
# Real-time monitoring
watch -n 1 'ps aux | head -20'       # Watch top processes
watch -d 'free -h'                   # Watch memory usage with differences highlighted
iotop                                 # I/O usage by process
iftop                                 # Network usage by connection

# System information
lscpu                                 # CPU information
lshw                                  # Hardware information
dmidecode                             # Hardware details from BIOS
sensors                               # Hardware temperature sensors
```

### Advanced File Operations

#### File Attributes and Extended Operations
```bash
# File attributes
chattr +i file.txt                   # Make file immutable
chattr -i file.txt                   # Remove immutable attribute
lsattr file.txt                      # List file attributes

# Advanced find operations
find . -name "*.log" -mtime +30 -delete              # Delete logs older than 30 days
find . -type f -size +100M -exec ls -lh {} \;        # Find large files
find . -type f -perm 777                             # Find files with specific permissions
find . -type f -user root -exec chown user {} \;     # Change ownership of files

# File comparison and analysis
diff -u file1.txt file2.txt          # Unified diff format
comm file1.txt file2.txt             # Compare sorted files line by line
cmp file1.txt file2.txt              # Compare files byte by byte
md5sum file.txt                      # Generate MD5 checksum
sha256sum file.txt                   # Generate SHA256 checksum
```

#### Advanced Text Processing
```bash
# AWK programming
awk '{sum += $1} END {print sum}' numbers.txt         # Sum first column
awk -F: '{print $1,$3}' /etc/passwd                  # Extract username and UID
awk 'NR==5,NR==10' file.txt                          # Print lines 5-10

# SED operations
sed -i 's/old/new/g' file.txt                        # In-place replacement
sed '5d' file.txt                                     # Delete line 5
sed '/pattern/d' file.txt                             # Delete lines containing pattern
sed -n '10,20p' file.txt                              # Print lines 10-20

# Advanced grep
grep -P '\d{3}-\d{3}-\d{4}' file.txt                # Perl regex for phone numbers
grep -o 'http[s]*://[^"]*' file.txt                  # Extract URLs
grep -A5 -B5 'ERROR' logfile.txt                     # Context around errors
```

### Network Operations

#### Network Diagnostics
```bash
# Network connectivity
mtr google.com                       # My TraceRoute (better than traceroute)
ss -tuln                             # Socket statistics
lsof -i :80                          # See what's using port 80
tcpdump -i eth0 port 80              # Capture packets on port 80

# Network configuration
ip addr show                         # Show IP addresses
ip route show                        # Show routing table
ip link show                         # Show network interfaces
netstat -rn                          # Show routing table (traditional)
```

#### Remote Operations
```bash
# SSH operations
ssh-keygen -t rsa -b 4096            # Generate SSH key pair
ssh-copy-id user@host                # Copy SSH key to remote host
ssh -L 8080:localhost:80 user@host   # SSH tunnel (local port forwarding)
scp -r directory/ user@host:/path/   # Secure copy directory

# Remote file synchronization
rsync -avz --progress local/ user@host:remote/       # Sync with progress
rsync -avz --delete local/ remote/                   # Sync and delete extras
rsync -avz --exclude='*.log' src/ dest/              # Sync excluding patterns
```

### System Administration

#### Disk and Filesystem Management
```bash
# Disk operations
fdisk -l                             # List disk partitions
lsblk -f                             # List block devices with filesystem info
blkid                                # Show filesystem UUIDs
mount /dev/sdb1 /mnt/usb             # Mount device
umount /mnt/usb                      # Unmount device

# Filesystem operations
fsck /dev/sdb1                       # Check filesystem
tune2fs -l /dev/sda1                 # Show filesystem parameters
resize2fs /dev/sda1                  # Resize ext2/3/4 filesystem
```

#### User and Group Management
```bash
# User operations
useradd -m -s /bin/bash username     # Add user with home directory
usermod -aG sudo username           # Add user to sudo group
passwd username                     # Change user password
userdel -r username                 # Delete user and home directory

# Group operations
groupadd groupname                  # Create group
groupmod -n newname oldname         # Rename group
gpasswd -a username groupname       # Add user to group
```

### Performance Optimization

#### System Performance
```bash
# CPU and memory analysis
top -o %CPU                         # Sort by CPU usage
htop -s PERCENT_CPU                 # htop sorted by CPU
vmstat 1 10                         # Virtual memory statistics
iostat -x 1 10                      # I/O statistics
sar -u 1 10                         # CPU utilization

# Disk performance
iotop -o                            # I/O usage by process
hdparm -t /dev/sda                  # Test disk read speed
dd if=/dev/zero of=testfile bs=1M count=1000  # Test write speed
```

#### Log Analysis
```bash
# System logs
journalctl -u service-name          # Show logs for specific service
journalctl -f                       # Follow system logs
journalctl --since "1 hour ago"     # Logs from last hour
dmesg | tail -20                    # Recent kernel messages

# Log analysis techniques
awk '{print $1}' access.log | sort | uniq -c | sort -nr    # Count IPs
grep "ERROR" logfile | wc -l                               # Count errors
tail -f logfile | grep --line-buffered "pattern"           # Real-time filtering
```

## 🔧 Productivity Tips

### Command Line Efficiency

#### History and Navigation
```bash
# History manipulation
history | grep command              # Search command history
!n                                  # Execute command number n
!!                                  # Repeat last command
!string                             # Last command starting with string
^old^new                            # Replace in last command

# Directory navigation
pushd /path/to/dir                  # Push directory to stack
popd                                # Pop directory from stack
dirs                                # Show directory stack
cd -                                # Go to previous directory
```

#### Aliases and Functions
```bash
# Useful aliases (add to ~/.bashrc)
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

# Useful functions
function mkcd() { mkdir -p "$1" && cd "$1"; }
function extract() {
    case $1 in
        *.tar.bz2) tar xjf $1 ;;
        *.tar.gz) tar xzf $1 ;;
        *.zip) unzip $1 ;;
        *) echo "Unknown format" ;;
    esac
}
```

### Automation Scripts

#### System Maintenance
```bash
#!/bin/bash
# System cleanup script
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean
find ~/.cache -type f -atime +30 -delete
echo "System maintenance completed!"
```

#### Backup Script
```bash
#!/bin/bash
# Simple backup script
BACKUP_DIR="/backup/$(date +%Y%m%d)"
SOURCE_DIR="/home/user/important"

mkdir -p "$BACKUP_DIR"
rsync -avz --delete "$SOURCE_DIR/" "$BACKUP_DIR/"
echo "Backup completed to $BACKUP_DIR"
```

## 🎯 Debugging and Troubleshooting

### System Debugging
```bash
# Process debugging
strace command                      # Trace system calls
ltrace command                      # Trace library calls
gdb program                         # GNU debugger
valgrind --tool=memcheck program    # Memory debugging

# System state
lsof | grep deleted                 # Find deleted files still in use
ps aux | grep zombie               # Find zombie processes
cat /proc/loadavg                  # System load
cat /proc/meminfo                  # Memory information
```

### Network Debugging
```bash
# Network troubleshooting
ping -c 4 8.8.8.8                 # Test internet connectivity
nslookup domain.com                # DNS lookup
dig +trace domain.com              # Trace DNS resolution
telnet host port                   # Test port connectivity
nc -zv host port                   # Test port with netcat
```

This advanced guide complements the main README and provides deeper insights into Linux command mastery. Practice these commands in a safe environment before using them in production systems.
