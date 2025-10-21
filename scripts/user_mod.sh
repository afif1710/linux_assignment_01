#!/usr/bin/env bash
# user_mod.sh - Section 5: User and Group Management

# 1) Create a new user named guestuser (without home directory)
if id guestuser &>/dev/null; then
  echo "User 'guestuser' already exists."
else
  sudo useradd -M guestuser && echo "User 'guestuser' created successfully."
fi

# 2) Create a new group named projectteam
if getent group projectteam &>/dev/null; then
  echo "Group 'projectteam' already exists."
else
  sudo groupadd projectteam && echo "Group 'projectteam' created successfully."
fi

# 3) Add guestuser to projectteam group
sudo usermod -aG projectteam guestuser && echo "Added guestuser to projectteam group."

# 4) Display all groups guestuser belongs to and save to ~/guest_groups.txt
groups guestuser | tee "$HOME/guest_groups.txt"

# 5) Confirm completion
echo "User and group management complete. Check ~/guest_groups.txt for details."
