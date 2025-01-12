# Paul Pasternak's NeoVim Config

## Dependencies
```
sudo apt install ripgrep fd-find bat fzf
```

## Plugins
- Telescope
- TreeSitter
- Cmp
- Oil
- NeoScroll
- CodeRunner
- git

## Install
```
mkdir -p ~/.config
git clone git@github.com:paul8800/neovimConfig.git ~/.config/nvim
cd ~/.config/nvim
```

## Example code runner RC.sh
```
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

[[ -f "$output_file" && "$status" -eq 0 ]] && echo "True" || echo "False"


if [[ -f "$output_file" && "$status" -eq 0 ]]; then
    echo "Running: $output_file"
    output=$("$output_file" 2>&1)
    status=$?
    gnome-terminal -- bash -c "echo \"$output\"; if [ $status -ne 0 ]; then echo 'Runtime error detected. Status: $status'; fi; exec bash"
    #gnome-terminal -- bash -c "echo $output; exec bash"
    #gnome-terminal -- bash -c "$output_file; runtime_status=\$?; if [ \$runtime_status -ne 0 ]; then echo 'Runtime error detected. Status:' \$runtime_status; fi; exec bash"
    runtime_status=\$?
    echo $output

    #gnome-terminal -- bash -c "$output_file; runtime_status=\$?; if [ \$runtime_status -ne 0 ]; then echo 'Runtime error detected. Status:' \$runtime_status; fi; echo 'Press any key to close...'; read -n 1; exec bash"
else
    echo "Compilation failed or output file not found."
    if [ $status -ne 0 ]; then
        echo "Compilation error details:"
        echo "$output"  # Print captured output
        # Open a new terminal and display the error message
        gnome-terminal -- bash -c "echo 'Compilation error details:'; echo \"$output\"; exec bash"
    fi
fi
```
