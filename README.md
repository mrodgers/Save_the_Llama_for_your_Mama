# Welcome to CopyBot: Private Chats with Your Private Docs

Hello! Welcome to the **CopyBot** experience, your new personal file assistant that revolutionizes how you interact with your files through intuitive chat features. Find the project on GitHub at [Save the Llama for your Mama](https://github.com/mrodgers/Save_the_Llama_for_your_Mama/).

## Getting Started

### 1. Clone the Repository
Start by cloning the repository from GitHub to have a local copy on your machine:
```sh
git clone https://github.com/mrodgers/Save_the_Llama_for_your_Mama.git
```

### 2. Install Dependencies
Navigate to the project directory and install the necessary dependencies using:
```sh
pip install -r requirements.txt
```

## Starting the Services

### Chainlit Server
To start the Chainlit server which hosts the chatbot, navigate to the project directory and use the following command:
```sh
chainlit run deploy.py -w
```
You can access the chatbot by visiting `localhost:8000` in your browser.

### Upload Server
Initiate the file upload server by running the following command in the project directory:
```sh
python fileupload.py
```
The server will start at `http://0.0.0.0:5000`, allowing you to upload and process PDF files seamlessly.

## Engage with CopyBot
Interact with your files like never before. Simply upload your files and start chatting to retrieve information with source references.

_Thank you for choosing CopyBot, where your files are just a chat away!_
