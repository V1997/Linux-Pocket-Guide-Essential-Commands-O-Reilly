#!/bin/bash

# Examples Directory - Practical Linux Command Examples
# This script demonstrates various Linux commands with real-world scenarios

echo "🚀 Linux Commands in Action - Practical Examples"
echo "=============================================="

# Create test environment
echo "📁 Setting up test environment..."
mkdir -p test_workspace/{documents,images,scripts,backup}
cd test_workspace

# Create sample files
echo "Creating sample files for demonstration..."
echo "Hello, World! This is a test file." > documents/hello.txt
echo "Line 1" > documents/multiline.txt
echo "Line 2" >> documents/multiline.txt
echo "Line 3" >> documents/multiline.txt
date > documents/timestamp.txt
echo "#!/bin/bash" > scripts/sample_script.sh
echo "echo 'This is a sample script'" >> scripts/sample_script.sh

echo "✅ Test environment created!"
echo

# Example 1: File Operations
echo "📂 Example 1: File Operations"
echo "------------------------------"
echo "Current directory contents:"
ls -la

echo -e "\nCopying files:"
cp documents/hello.txt backup/
echo "✓ Copied hello.txt to backup/"

echo -e "\nMoving files:"
mv documents/timestamp.txt documents/creation_time.txt
echo "✓ Renamed timestamp.txt to creation_time.txt"

echo

# Example 2: File Content Viewing
echo "📖 Example 2: Viewing File Contents"
echo "-----------------------------------"
echo "Using 'cat' to display file:"
cat documents/hello.txt

echo -e "\nUsing 'head' to show first lines:"
head -2 documents/multiline.txt

echo -e "\nUsing 'wc' to count words and lines:"
wc documents/multiline.txt

echo

# Example 3: File Permissions
echo "🔐 Example 3: File Permissions"
echo "------------------------------"
echo "Current permissions for script:"
ls -l scripts/sample_script.sh

echo -e "\nMaking script executable:"
chmod +x scripts/sample_script.sh
ls -l scripts/sample_script.sh
echo "✓ Script is now executable"

echo

# Example 4: Searching and Finding
echo "🔍 Example 4: Search Operations"
echo "-------------------------------"
echo "Finding all .txt files:"
find . -name "*.txt"

echo -e "\nSearching for 'Hello' in files:"
grep -r "Hello" .

echo -e "\nCounting lines in all text files:"
find . -name "*.txt" -exec wc -l {} \;

echo

# Example 5: Process Information
echo "⚙️  Example 5: System Information"
echo "--------------------------------"
echo "Current user and directory:"
echo "User: $(whoami)"
echo "Directory: $(pwd)"
echo "Date: $(date)"

echo -e "\nDisk usage of current directory:"
du -sh .

echo

# Example 6: Command Chaining
echo "🔗 Example 6: Command Chaining"
echo "------------------------------"
echo "Creating and verifying a file in one line:"
echo "Test content" > test_file.txt && echo "✓ File created" && cat test_file.txt

echo -e "\nUsing pipes to process data:"
ls -la | grep "txt" | wc -l
echo "^ Number of .txt files found"

echo

# Cleanup
echo "🧹 Cleaning up test environment..."
cd ..
rm -rf test_workspace
echo "✅ Cleanup complete!"

echo
echo "🎉 Examples completed! These demonstrations show:"
echo "   • File operations (create, copy, move)"
echo "   • Content viewing (cat, head, wc)"
echo "   • Permission management (chmod)"
echo "   • Search operations (find, grep)"
echo "   • System information commands"
echo "   • Command chaining with && and |"
echo
echo "Try running individual commands to explore further!"
