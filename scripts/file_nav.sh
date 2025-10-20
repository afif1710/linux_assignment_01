#!/usr/bin/env bash
# file_nav.sh - Section 1: File System Navigation
# Output files will be created in the current user's home directory ($HOME)

# Ensure working from the user's home directory
cd "$HOME" || { echo "ERROR: could not change to $HOME"; exit 1; }

# 1) List all contents of the current user's home directory to home_list.txt
ls -la > "$HOME/home_list.txt"

# 2) Change to /var/log and list contents to var_log.txt (saved in home)
# If cd fails (permission or missing), write an error message into var_log.txt so the file exists
if cd /var/log 2>/dev/null; then
  ls -la > "$HOME/var_log.txt"
else
  echo "ERROR: cannot access /var/log" > "$HOME/var_log.txt"
fi

# 3) Display the path to bash executable using which
echo "Bash executable path:"
which bash || echo "which command failed or bash not found"

# 4) Display the current shell information
echo "Default login shell (SHELL): $SHELL"
echo "Current running shell for this script (process):"
ps -p $$ -o comm= || echo "ps command failed"
