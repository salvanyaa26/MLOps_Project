# Production-Ready MLOps: Sentiment AI

**The "Why" (Problem Statement):** Manual deployment of AI models often leads to version drift and slow releases. This project automates the entire lifecycle of a Natural Language Processing (NLP) model using modern Cloud-Native practices.

## Architecture Diagram
Code → GitHub Actions → Azure Container Registry → Azure Kubernetes Service.

## The Tech Stack
* **Application:** Python 3.10, FastAPI
* **AI Model:** Hugging Face (`distilbert-base-uncased`)
* **Containerization:** Docker 
* **Infrastructure:** Terraform, Azure, Kubernetes

## Phase 1: Local API (Completed)
Successfully served a highly efficient, distilled BERT model using FastAPI for high-throughput, asynchronous sentiment analysis.