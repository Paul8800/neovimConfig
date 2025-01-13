#!/bin/bash

# Check if a file is provided (first argument)
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <source_file>"
    exit 1
fi

# Get the file name
src_file="$1"

# Read the first line of the file
first_line=$(head -n 1 "$src_file")

# Initialize command and output file variables
command=""
output_file=""

# Check if the first line contains the RC command
if [[ "$first_line" == "//RC:"* ]]; then
    command="${first_line:6}"  # Extract the command after "//RC: "
    output_file=$(echo "$command" | awk -F' ' '{for(i=1;i<=NF;i++) if($i=="-o") print $(i+1)}')  # Get the output file name from the command
else
    # Handle default behavior based on file extension if no command is found
    filename=$(basename "$src_file")
    extension="${filename##*.}"

    case "$extension" in
        c)
            command="gcc $src_file -o ${filename%.*}"  # Default command
            ;;
        cpp)
            command="g++ $src_file -o ${filename%.*}"  # Default command
            ;;
        java)
            command="javac $src_file && java ${filename%.*}"  # Default command
            ;;
        py)
            command="python3 $src_file"  # Python doesn't need an output file
            ;;
        html)
            command="xdg-open $src_file"  # HTML doesn't need an output file
            ;;
        *)
            echo "Unsupported file type."
            exit 1
            ;;
    esac
fi
# Execute the command and capture output and errors
output=$(eval "$command")
status=$?


if [[ -f "$output_file" && "$status" -eq 0 ]]; then
    ~/NeoVimProjects/temp/temp
fi
