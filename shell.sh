#!/bin/sh
#The shell script below performs the following operations

#- create two directories
echo "Making directory test and testTwo in ~/Documents"

#- check if directory ~/Documents/test exists
echo "> checking if directory ~/Documents/test exists..."
if [ -d ~/Documents/test ]; then
    echo "> directory ~/Documents/test exists"
    rm -r ~/Documents/test
fi

mkdir ~/Documents/test && mkdir ~/Documents/testTwo
echo "> Directories successfully created"

#- changes directory to documents
echo "> Navigating to ~/Documents/test"
cd ~/Documents/test

#- Creates two files
echo "> Creating one.txt and two.txt"
touch one.txt two.txt

#- Writes into file one
CONTENT="this is file one"
echo $CONTENT > one.txt

#- Copies the content of fileA.txt into fileB.txt
echo "> Copying one.txt into two.txt"
cat one.txt > two.txt

#- Moves all files in test into the testTwo directory
echo "> Moving files from test directory to testTwo"
mv ~/Documents/test/* ~/Documents/testTwo

#- Copy one.txt from testTwo to test
echo "> Copying one.txt to directory test"
cp ~/Documents/testTwo/one.txt ~/Documents/test

#- Lists the content of the directory and opens the created files
echo "> contents:"
cd ~/Documents/testTwo/ && ls -al && open -e ./*.txt

#- Delete all files from testTwo directory
echo "Deleting directory testTwo and all its content"
rm -r ~/Documents/testTwo/

echo "done"

#- prompt the user to enter the name of logged in user
read -p "Enter the name of logged in user: " user

#- show running processes by name entered above
printf "The following processes are running:\n"
ps -u $user

#- prompt user to enter a folder/file name
read -p "Enter a folder or file name to search in ~/Documents " keyword


#- filter file list by keyword passed above
ls -l ~/Documents | grep $keyword