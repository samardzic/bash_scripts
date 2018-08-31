#!/bin/bash

# Display message for the user
echo -e "Enter the FILE NAME (with extension) that you want to create"

# Store  user entered text to "filename" variable
read filename

# Create filename and changes the file to executable
touch $filename && chmod +x $filename

