#!/usr/bin/env bash
# file_own.sh - Section 4: Ownership (create project/report.txt and set permissions)

cd "$HOME" || { echo "ERROR: cannot change to $HOME"; exit 1; }

# 1) Create directory named project
mkdir -p "$HOME/project"

# 2) Create a file named report.txt inside the project directory
: > "$HOME/project/report.txt"

# 3) Set permissions of report.txt to read/write owner, read-only group and others (644)
chmod 644 "$HOME/project/report.txt"

# 4) Set permissions of project directory to rwx owner, rx group and others (755)
chmod 755 "$HOME/project"

# 5) Display verification info
echo "---- report.txt (long listing) ----"
ls -l "$HOME/project/report.txt" || echo "Cannot list report.txt"

echo "---- project directory (long listing) ----"
ls -ld "$HOME/project" || echo "Cannot list project directory"
