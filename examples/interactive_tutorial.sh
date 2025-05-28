#!/bin/bash

# Interactive Linux Commands Tutorial
# This script provides an interactive learning experience

echo "🎓 Interactive Linux Commands Tutorial"
echo "======================================"
echo "This tutorial will guide you through essential Linux commands step by step."
echo

read -p "Press Enter to start..."

# Function to wait for user input
wait_for_user() {
    echo
    read -p "Press Enter to continue to the next section..."
    echo
}

# Section 1: Basic File Operations
echo "📂 SECTION 1: Basic File Operations"
echo "-----------------------------------"
echo "Let's start with basic file operations. We'll create some test files first."
echo

echo "Creating a test directory and files..."
mkdir -p tutorial_workspace
cd tutorial_workspace

echo "Hello World!" > greeting.txt
echo "This is line 1" > sample.txt
echo "This is line 2" >> sample.txt
echo "This is line 3" >> sample.txt

echo "✅ Test files created!"
echo
echo "Now let's explore these files:"
echo

echo "1. List files with 'ls':"
echo "Command: ls -la"
ls -la
wait_for_user

echo "2. Display file content with 'cat':"
echo "Command: cat greeting.txt"
cat greeting.txt
wait_for_user

echo "3. Count lines, words, and characters with 'wc':"
echo "Command: wc sample.txt"
wc sample.txt
echo "   ^ lines   words   characters   filename"
wait_for_user

# Section 2: File Permissions
echo "🔐 SECTION 2: File Permissions"
echo "------------------------------"
echo "Let's create a script and learn about permissions:"

echo "#!/bin/bash" > myscript.sh
echo "echo 'Hello from script!'" >> myscript.sh

echo "Script created. Let's check its permissions:"
echo "Command: ls -l myscript.sh"
ls -l myscript.sh
echo
echo "Notice the permissions: -rw-r--r--"
echo "This means: owner can read/write, group and others can only read"
wait_for_user

echo "Now let's make it executable:"
echo "Command: chmod +x myscript.sh"
chmod +x myscript.sh
ls -l myscript.sh
echo
echo "Now it shows: -rwxr-xr-x (executable for owner)"
wait_for_user

echo "Let's run our script:"
echo "Command: ./myscript.sh"
./myscript.sh
wait_for_user

# Section 3: Searching and Finding
echo "🔍 SECTION 3: Searching and Finding"
echo "-----------------------------------"
echo "Let's create more files to practice searching:"

echo "apple" > fruits.txt
echo "banana" >> fruits.txt
echo "orange" >> fruits.txt
echo "apple pie recipe" > recipes.txt
echo "banana bread" >> recipes.txt

echo "Files created. Now let's search:"
echo

echo "1. Find all .txt files:"
echo "Command: find . -name '*.txt'"
find . -name "*.txt"
wait_for_user

echo "2. Search for 'apple' in all files:"
echo "Command: grep -r 'apple' ."
grep -r "apple" .
wait_for_user

echo "3. Count how many .txt files we have:"
echo "Command: find . -name '*.txt' | wc -l"
find . -name "*.txt" | wc -l
wait_for_user

# Section 4: Pipes and Redirection
echo "🔗 SECTION 4: Pipes and Command Chaining"
echo "----------------------------------------"
echo "Let's combine commands using pipes and redirection:"

echo "1. List files and count them:"
echo "Command: ls -1 | wc -l"
ls -1 | wc -l
echo "   ^ This counts the number of files"
wait_for_user

echo "2. Sort and display unique words from fruits.txt:"
echo "Command: sort fruits.txt | uniq"
sort fruits.txt | uniq
wait_for_user

echo "3. Find and count lines containing 'a':"
echo "Command: grep 'a' *.txt | wc -l"
grep 'a' *.txt | wc -l
wait_for_user

# Section 5: System Information
echo "💻 SECTION 5: System Information"
echo "--------------------------------"
echo "Let's gather some system information:"

echo "1. Current user and location:"
echo "Command: whoami && pwd"
whoami && pwd
wait_for_user

echo "2. Current date and time:"
echo "Command: date"
date
wait_for_user

echo "3. Disk usage of current directory:"
echo "Command: du -sh ."
du -sh .
wait_for_user

# Cleanup and completion
echo "🧹 CLEANUP"
echo "----------"
echo "Let's clean up our tutorial workspace:"
cd ..
rm -rf tutorial_workspace
echo "✅ Workspace cleaned up!"

echo
echo "🎉 CONGRATULATIONS!"
echo "==================="
echo "You've completed the interactive Linux commands tutorial!"
echo
echo "📚 What you've learned:"
echo "• Basic file operations (ls, cat, wc)"
echo "• File permissions (chmod)"
echo "• Searching and finding (find, grep)"
echo "• Pipes and command chaining (|, &&)"
echo "• System information commands"
echo
echo "🚀 Next steps:"
echo "• Practice these commands on your own"
echo "• Explore the main README.md for more commands"
echo "• Check out CHEAT_SHEET.md for quick reference"
echo
echo "Happy Linux learning! 🐧"
