from fastapi import FastAPI
from pydantic import BaseModel
from transformers import pipeline

app = FastAPI(title="Production-Ready Sentiment AI")

print("Loading AI Model... Please wait.")
sentiment_model = pipeline("sentiment-analysis", model="distilbert-base-uncased-finetuned-sst-2-english")
print("Model loaded successfully!")

class SentimentRequest(BaseModel):
    text: str

@app.get("/")
def health_check():
    return {"status": "API is running! AI is loaded."}

@app.post("/analyze")
def analyze_sentiment(request: SentimentRequest):
    result = sentiment_model(request.text)
    return {
        "original_text": request.text,
        "prediction": result[0]
    }