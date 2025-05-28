#!/bin/bash

# Linux Command Practice Exercises
# This script provides hands-on exercises to practice Linux commands

echo "í¾¯ Linux Command Practice Exercises"
echo "==================================="
echo "This script will guide you through practical exercises."
echo "Follow the instructions and practice the commands!"
echo

# Create a practice workspace
WORKSPACE="practice_workspace"
mkdir -p "$WORKSPACE"
cd "$WORKSPACE"

echo "í³ Setting up practice environment..."
echo "Creating practice directory: $WORKSPACE"
echo

# Exercise 1: File Creation and Management
echo "í³ EXERCISE 1: File Creation and Management"
echo "-------------------------------------------"
echo "Task: Create a file called 'myfile.txt' with some content"
echo "Hint: Use 'echo \"your content\" > filename' or 'touch filename'"
echo
read -p "Press Enter when you've created the file..."

if [ -f "myfile.txt" ]; then
    echo "âœ… Great! File 'myfile.txt' found!"
    echo "Content: $(cat myfile.txt 2>/dev/null || echo "File is empty")"
else
    echo "âŒ File 'myfile.txt' not found. Here's how to create it:"
    echo "   echo \"Hello World\" > myfile.txt"
    echo "   Creating it for you..."
    echo "Practice content" > myfile.txt
fi
echo

# Exercise Summary
echo "í¾‰ PRACTICE COMPLETE!"
echo "====================="
echo "í³Š Commands you've practiced:"
echo "â€¢ File creation: echo, touch"
echo "â€¢ Directory operations: mkdir, cd"
echo
echo "íº€ Next Steps:"
echo "â€¢ Practice these commands on your own"
echo "â€¢ Try the interactive_tutorial.sh for guided learning"
echo "â€¢ Run practical_demo.sh to see commands in action"
echo

# Cleanup
echo "í·¹ Cleaning up practice workspace..."
cd ..
rm -rf "$WORKSPACE"
echo "âœ… Practice environment cleaned up!"
echo
echo "Keep practicing and exploring Linux commands! í°§"
