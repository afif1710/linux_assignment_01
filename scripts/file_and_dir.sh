#!/usr/bin/env bash
# file_and_dir.sh - Section 2: File and Directory Operations

# Always start from the user's home directory
cd "$HOME" || { echo "ERROR: Could not change to home directory"; exit 1; }

# 1) Create a directory named linux_fundamentals in the current user's home directory
mkdir -p "$HOME/linux_fundamentals"

# 2) Inside linux_fundamentals, create a subdirectory named scripts
mkdir -p "$HOME/linux_fundamentals/scripts"

# 3) Create an empty file named example.txt inside the linux_fundamentals directory
touch "$HOME/linux_fundamentals/example.txt"

# 4) Copy example.txt to the scripts directory
cp "$HOME/linux_fundamentals/example.txt" "$HOME/linux_fundamentals/scripts/"

# 5) Move example.txt from linux_fundamentals to linux_fundamentals/backup
mkdir -p "$HOME/linux_fundamentals/backup"
mv "$HOME/linux_fundamentals/example.txt" "$HOME/linux_fundamentals/backup/"

# 6) Change permissions of example.txt (in both locations) to rw-r--r--
chmod 644 "$HOME/linux_fundamentals/scripts/example.txt"
chmod 644 "$HOME/linux_fundamentals/backup/example.txt"

# 7) Verify and display the permission changes
echo "Permissions after update:"
ls -l "$HOME/linux_fundamentals/scripts/example.txt"
ls -l "$HOME/linux_fundamentals/backup/example.txt"
