#!/bin/bash

# Function to get the PID of running processes
get_pids() {
    CHAINLIT_PID=$(pgrep -f "chainlit run deploy.py -w")
    FILEUPLOAD_PID=$(pgrep -f "python3 fileupload.py")
}

# Function to kill running processes
kill_processes() {
    if [ ! -z "$CHAINLIT_PID" ]; then
        kill $CHAINLIT_PID
        echo "Stopped running chainlit process (PID: $CHAINLIT_PID)"
    fi
    if [ ! -z "$FILEUPLOAD_PID" ]; then
        kill $FILEUPLOAD_PID
        echo "Stopped running fileupload.py process (PID: $FILEUPLOAD_PID)"
    fi
}

# Get the PIDs of any running processes
get_pids

# If either process is running, stop them
kill_processes

# Check if "chainlit" command is available
if ! command -v chainlit &> /dev/null
then
    echo "chainlit command not found. Please install it first."
    exit 1
fi

# Start the chainlit process in the background
nohup chainlit run deploy.py -w > chainlit_output.log 2> chainlit_error.log &

# Get the PID of the last background process (chainlit process in this case)
CHAINLIT_PID=$!

# Start the fileupload.py process in the background
nohup python3 fileupload.py > fileupload_output.log 2> fileupload_error.log &

# Get the PID of the last background process (fileupload.py process in this case)
FILEUPLOAD_PID=$!

# Print the PID so you can use it to manage the processes (like killing them later if necessary)
echo "Chainlit process started with PID: $CHAINLIT_PID"
echo "Fileupload process started with PID: $FILEUPLOAD_PID"

# Print a message indicating where the logs can be found
echo "Chainlit output is being logged to 'chainlit_output.log' and errors to 'chainlit_error.log'."
echo "Fileupload output is being logged to 'fileupload_output.log' and errors to 'fileupload_error.log'."

# Exit the script
exit 0
