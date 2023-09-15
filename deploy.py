#Originally taken from a blog post https://medium.com/python-in-plain-english/super-quick-fine-tuning-llama-2-0-on-cpu-with-personal-data-d2d284559f
from langchain import PromptTemplate
from langchain.embeddings import HuggingFaceEmbeddings
from langchain.vectorstores import FAISS
from langchain.llms import CTransformers
from langchain.chains import RetrievalQA
import chainlit as cl

DB_FAISS_PATH = "vectorstores/db_faiss/"

custom_prompt_template='''
Please carefully utilize the following details to provide a precise response to the user's query. It's critical to maintain the confidentiality of the data and to provide information that is both safe and accurate. If the answer is not within the data presented, kindly acknowledge that the information is not available instead of speculating.

[Context]
Provided context: {context}

[Question]
User's query: {question}

Respond responsibly and directly in the space provided below. Ensure to relay only the pertinent answer without any additional information.

[Confidential Response]
'''

def set_custom_prompt():
 # Prompt template for QA retrieval for each vector store
 
 prompt = PromptTemplate(template=custom_prompt_template, input_variables=['context','question'])

 return prompt


def load_llm():
 llm = CTransformers(
  model='llama-2-7b-chat.ggmlv3.q8_0.bin',
  model_type='llama',
  max_new_tokens=1024,
  temperature=0.1
  )
 return llm


def retrieval_qa_chain(llm,prompt,db):
 qa_chain=RetrievalQA.from_chain_type(
  llm=llm,
  chain_type="stuff",
  retriever=db.as_retriever(search_kwargs={'k':2}),
   return_source_documents=True,
   chain_type_kwargs={'prompt':prompt  }
  )
 return qa_chain

def qa_bot():
 embeddings=HuggingFaceEmbeddings(model_name='sentence-transformers/all-MiniLM-L6-v2',
  model_kwargs={'device':'cpu'})
 db = FAISS.load_local(DB_FAISS_PATH,embeddings)
 llm=load_llm()
 qa_prompt=set_custom_prompt()
 qa = retrieval_qa_chain(llm,qa_prompt,db)
 return qa 


def final_result(query):
 qa_result=qa_bot()
 response=qa_result({'query':query})
 return response 

## chainlit here
@cl.on_chat_start
async def start():
 chain=qa_bot()
 msg=cl.Message(content="Firing up the PromptMule Compeititive Analysis bot...")
 await msg.send()
 msg.content= "Hi, welcome to PromptMule Competitive Analysis bot. What should I think about?"
 await msg.update()
 cl.user_session.set("chain",chain)


@cl.on_message
async def main(message):
 chain=cl.user_session.get("chain")
 cb = cl.AsyncLangchainCallbackHandler(
  stream_final_answer=True, answer_prefix_tokens=["FINAL","ANSWER"]
  )
 cb.ansert_reached=True
 res=await chain.acall(message, callbacks=[cb])
 answer=res["result"]
 sources=res["source_documents"]

 if sources:
  answer+=f"\nSources: "+str(str(sources))
 else:
  answer+=f"\nNo Sources found"

 await cl.Message(content=answer).send() 


