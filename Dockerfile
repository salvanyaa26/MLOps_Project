# 1. Start with a lightweight Linux environment that already has Python installed
FROM python:3.10-slim

# 2. Set up a working directory inside our new container
WORKDIR /app

# 3. Copy our ingredients list into the container
COPY requirements.txt .

# 4. Install the ingredients (the --no-cache-dir flag keeps the container small!)
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy our actual code (main.py) into the container
COPY . .

# 6. Open port 7860 so the outside world can talk to our API
EXPOSE 7860
# 7. The command to turn the engine on when the container starts
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"]
