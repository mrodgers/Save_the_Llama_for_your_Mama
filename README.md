# CopyBot Private Chatbot Project

## Overview
The Chatbot project is a powerful chatbot system designed to provide answers along with source references by parsing through personal data. It leverages technologies like Chainlit for hosting and uses the Llama2 model to operate efficiently on a CPU (not an even more expensive GPU). This guide will walk you through setting up and running the project on your local machine.

## Prerequisites
- Operating System: Ubuntu (known to work)
- Python: Version 3.10 or above
- RAM: Minimum 16GB (8GB might fail after a few queries)
- Hard Disk Space: Minimum 7GB for the llama model, additional space for your data

## Installation

### Step 1: Set up Project Directory
Create a folder named `llama2_project` and download the llama2 model into it. The model can be downloaded from the provided link in the original guide.

### Step 2: Install Necessary Packages
Create a file named `requirements.txt` and list the following libraries in it:

```plaintext
pypdf
langchain
torch
accelerate
bitsandbytes
transformers
sentence_transformers
faiss_cpu
chainlit
ctransformers
flask
```

Install the packages using the following command:
```sh
pip install -r requirements.txt
```

## Data Processing and Web Application Setup
In this step, we will set up a Flask web application to handle file uploads and data processing. The application utilizes several modules from the langchain package for data processing.

Here is a breakdown of the Flask application code structure:

### File Upload and Data Processing Script
Save the following code to a file named `fileupload.py`. This script configures a Flask web application with routes to facilitate PDF file uploads and initiate data processing to create a vector database.

```python
# Few parts harvested from a blog post on Medium, thank you to...
# ...[the rest of your code here]...
```

### Running the Flask Application
Navigate to the directory containing the `fileupload.py` file in the terminal and initiate the Flask server with the command:

```sh
python fileupload.py
```

The application will start and be accessible at `http://0.0.0.0:5000`. You can upload PDF files via the upload route and initiate data processing through the process route.

## Deploying the Model
[...the rest of the instructions here...]

## Contributors
- Eduardo Alvarez (Title Rectification)
- AI Anytime (Video Tutorial)

## Additional Resources
For a detailed walkthrough and further explanations, refer to the AI Anytime video tutorial mentioned in the main guide.

## License
[Specify the License type here, if any]

## Contact
[Your Contact Information Here]
```

Make sure to complete the section labeled "[...the rest of the instructions here...]" with further instructions on deploying the model, as present in your original guide.
