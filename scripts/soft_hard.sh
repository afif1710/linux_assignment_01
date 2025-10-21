#!/bin/bash
# Section 6: Hard/Soft Link

echo "Creating original.txt..."
echo "This is the original file content." > ~/original.txt

echo "Creating symbolic link softlink.txt..."
ln -s ~/original.txt ~/softlink.txt

echo "Verifying symbolic link:"
ls -l ~/softlink.txt

echo "Deleting original file..."
rm ~/original.txt

echo "Verifying symbolic link after deleting original:"
ls -l ~/softlink.txt

echo "Creating datafile.txt..."
echo "This is data file content." > ~/datafile.txt

echo "Creating hard link hardlink.txt..."
ln ~/datafile.txt ~/hardlink.txt

echo "Verifying hard link:"
ls -l ~/hardlink.txt

echo "Displaying inode numbers:"
ls -li ~/datafile.txt ~/hardlink.txt

echo "Deleting original datafile.txt..."
rm ~/datafile.txt

echo "Verifying hard link after deleting datafile:"
ls -l ~/hardlink.txt

echo "Finding all .txt files in home directory and saving to file_list.txt..."
find ~ -type f -name "*.txt" > ~/file_list.txt

echo "Displaying file_list.txt:"
cat ~/file_list.txt

echo "Section 6 complete!"
