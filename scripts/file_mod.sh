#!/usr/bin/env bash
# file_mod.sh - Section 3: File Modification 
# 1) Ensure we are in the user's home directory
cd "$HOME" || { echo "ERROR: Could not change to home directory"; exit 1; }

# 2) Create a file named example.txt
touch example.txt

# 3) Create a user 'student' without a home directory and without shell
#    -s /usr/sbin/nologin prevents login
#    -M prevents home directory creation
# If the user already exists, skip creation
if id "student" &>/dev/null; then
    echo "User 'student' already exists"
else
    sudo useradd -M -s /usr/sbin/nologin student
    echo "User 'student' created"
fi

# 4) Change the owner of example.txt to 'student'
sudo chown student example.txt

# 5) Change the group of example.txt to 'student'
sudo chgrp student example.txt

# 6) Verify and display the changes
echo "File ownership and group after modification:"
ls -l example.txt
