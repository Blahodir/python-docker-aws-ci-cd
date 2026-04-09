from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
def read_root():
    # Беремо назву середовища з перемінних оточення (важливо для Cloud-Native)
    env_name = os.getenv("ENVIRONMENT", "Local")
    return {
        "status": "online",
        "project": "FjordStep-Cloud-Analytics",
        "location": "AWS Norway (Aukra)",
        "env": env_name
    }
