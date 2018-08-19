#!/bin/bash

# Changes directory to working folder
# cd /home/docker/Dropbox/Bash_Scripts

# Display message for the user
printf "\n-------------------------------------------------------------\n"
echo "Enter the FILE NAME (with extension) that you want to create:"

# Store  user entered text to "filename" variable
read filename

# Create filename and changes the file to executable
touch $filename && chmod +x $filename

# Edit created file
nano $filename 

# Create BASH SCRIPT definition
# echo -e "#!/bin/bash"
