#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 <file_path> <text_string>"
    exit 1
}

# Check if exactly two arguments are passed
if [ "$#" -ne 2 ]; then
    usage
fi

# Assign arguments to variables
FILE_PATH=$1
TEXT_STRING=$2

# Extract the directory path from the file path
DIR_PATH=$(dirname "$FILE_PATH")

# Create the entire directory hierarchy if it does not exist
if ! mkdir -p "$DIR_PATH"; then
    echo "Error: Could not create directory path $DIR_PATH"
    exit 1
fi

# Attempt to create or overwrite the file and write the text string to it
if ! echo "$TEXT_STRING" > "$FILE_PATH"; then
    echo "Error: Could not create or write to file $FILE_PATH"
    exit 1
fi

# Exit with success code
exit 0
