# Quick Reference Cheat Sheet

## 🚀 Most Used Commands

### File Operations
```bash
ls -la          # List files with details
cp file dest    # Copy file
mv file dest    # Move/rename file
rm file         # Delete file
mkdir dir       # Create directory
rmdir dir       # Remove empty directory
rm -rf dir      # Remove directory and contents
```

### File Viewing
```bash
cat file        # Display file content
less file       # View file with pagination
head file       # First 10 lines
tail file       # Last 10 lines
tail -f file    # Follow file changes
```

### File Permissions
```bash
chmod 755 file  # rwxr-xr-x
chmod +x file   # Add execute permission
chown user file # Change owner
```

### Search & Find
```bash
find . -name "*.txt"           # Find files by name
grep "pattern" file            # Search in file
grep -r "pattern" dir          # Recursive search
locate filename                # Quick file location
which command                  # Find command location
```

### Process Management
```bash
ps aux          # List all processes
top             # Live process monitor
htop            # Better process monitor
kill PID        # Kill process by ID
killall name    # Kill processes by name
jobs            # List background jobs
nohup cmd &     # Run command in background
```

### System Info
```bash
df -h           # Disk space
du -sh dir      # Directory size
free -h         # Memory usage
uname -a        # System information
whoami          # Current user
id              # User and group IDs
```

### Network
```bash
ping host       # Test connectivity
wget url        # Download file
curl url        # Transfer data
netstat -tulpn  # Network connections
ss -tulpn       # Modern netstat
```

### Archives
```bash
tar -czf archive.tar.gz files  # Create compressed archive
tar -xzf archive.tar.gz        # Extract compressed archive
zip -r archive.zip files       # Create zip archive
unzip archive.zip              # Extract zip archive
```

### Text Processing
```bash
sort file       # Sort lines
uniq file       # Remove duplicates
wc file         # Count lines/words/chars
cut -d: -f1     # Extract fields
awk '{print $1}' # Process columns
sed 's/old/new/g' # Replace text
```

## 🔧 Command Combinations

```bash
# Find large files
find . -type f -size +100M

# Find recently modified files
find . -type f -mtime -7

# Count files in directory
ls -1 | wc -l

# Find processes using port
netstat -tulpn | grep :80

# Monitor disk usage
watch df -h

# Find and replace in multiple files
find . -name "*.txt" -exec sed -i 's/old/new/g' {} \;
```

## 🎯 Quick Tips

- Use `!!` to repeat last command
- Use `!$` for last argument of previous command
- Use `Ctrl+R` for command history search
- Use `&&` to chain commands (run next only if previous succeeds)
- Use `||` for fallback commands (run next only if previous fails)
- Use `&` to run commands in background
