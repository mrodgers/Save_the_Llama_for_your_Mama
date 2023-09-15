#!/bin/bash

# Update pip to the latest version
python3 -m pip install --upgrade pip

# Install required Python packages
pip install sentence-transformers
pip install faiss-cpu
pip install flask

# Set up the required directories
mkdir -p /home/azureuser/Llama2-hf/data
mkdir -p vectorstores/db_faiss
mkdir -p templates

# Copy the index.html file to the templates directory (adjust the source path as necessary)
cp path_to_your_index.html_file/index.html templates/

# For custom packages, you might use git to clone and install them, for example:
# git clone https://github.com/yourusername/langchain.git
# cd langchain
# pip install .

# git clone https://github.com/yourusername/chainlit.git
# cd ..
# cd chainlit
# pip install .

# Reminder to the user to install the new chainlit.md file
echo "Reminder: Please ensure to install the new version of the chainlit.md file over the existing one in the installed directory."
