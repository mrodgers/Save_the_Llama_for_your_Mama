#!/bin/bash

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
