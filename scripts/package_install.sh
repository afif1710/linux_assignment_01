#!/usr/bin/env bash
# package_install.sh - Section 7: Update repo cache, install tree, install gcloud CLI

set -euo pipefail

echo "1) Updating apt package cache..."
sudo apt update -y

echo
echo "2) Installing 'tree' package..."
sudo apt install -y tree

echo
echo "3) Installing prerequisites for adding Google Cloud SDK repository..."
sudo apt install -y apt-transport-https ca-certificates gnupg curl

echo
echo "4) Adding Google Cloud SDK apt repository key and repo (secure method)..."
# Save Google apt key
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

# Add the repo with signed-by
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list > /dev/null

echo
echo "5) Update apt and install google-cloud-cli..."
sudo apt update -y
sudo apt install -y google-cloud-cli

echo
echo "6) Verification:"
echo " - tree version:"
tree --version || echo "tree not found"

echo
echo " - gcloud version:"
gcloud --version || echo "gcloud not found"

echo
echo "All done."

