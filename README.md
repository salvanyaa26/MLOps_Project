# Production-Ready MLOps: Sentiment AI Microservice

**Live Cloud Demo:** [Live API](https://salvanyaa2608-sentiment-ai-api.hf.space/docs)

**The "Why" (Problem Statement):** Manual deployment of AI models often leads to version drift, hardware constraints, and slow releases. This project automates the entire lifecycle of a Natural Language Processing (NLP) model using modern Cloud-Native and MLOps practices, ensuring scalability and zero-downtime updates.

---

## Architecture & Deployment Strategy

### 1. Current Live Deployment (MVP)
To provide a live, accessible demo without incurring heavy, always-on cloud computing costs, the current iteration is deployed using:
* **CI/CD:** GitHub Actions (Automated Docker Builds verifying code integrity on every push)
* **Cloud Hosting:** Hugging Face Spaces (Free 16GB RAM AI-optimized environment to bypass standard 512MB RAM free-tier limits)
* **Containerization:** Docker (`python:3.10-slim` base image)

### 2. Target Enterprise Architecture (Blueprints)
This project is designed to seamlessly scale to enterprise levels when cloud budgets allow. The `terraform/` and `k8s/` directories contain the exact Infrastructure as Code (IaC) blueprints required to migrate this application to Microsoft Azure:
* **Infrastructure Provisioning:** Terraform (`main.tf`) configured to build an Azure Container Registry (ACR) and an Azure Kubernetes Service (AKS) cluster.
* **Orchestration:** Kubernetes manifests (`deployment.yaml`) designed to deploy multiple replicas of the API, handle self-healing, and route traffic via a Load Balancer.

---

## The Tech Stack
* **Application Core:** Python 3.10, FastAPI, Uvicorn, Pydantic
* **Machine Learning:** Hugging Face `transformers` (`distilbert-base-uncased-finetuned-sst-2-english`), PyTorch
* **DevOps / Infrastructure:** Docker, GitHub Actions, Kubernetes (Tested locally via Docker Desktop), Terraform

---

## To Run the Project Locally

### Option A: Run via Docker (Standard)
1. Build the image:
   ```bash
   docker build -t sentiment-api:v2 .