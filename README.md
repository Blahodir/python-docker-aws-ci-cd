![Build Status](https://github.com/Blahodir/python-docker-aws-ci-cd/actions/workflows/deploy.yml/badge.svg)

Cloud-Native Secure CI/CD Pipeline
This project demonstrates a modern, production-ready DevSecOps workflow for a Python-based microservice. It focuses on automated containerization, secure cloud authentication, and continuous delivery to AWS.

🚀 Key Features
FastAPI Backend: A lightweight and high-performance Python web service.

Security-First Auth: Uses AWS OIDC (OpenID Connect) for GitHub Actions. No long-lived AWS Access Keys are stored in GitHub Secrets.

Optimized Dockerization: Implements Multi-stage builds to minimize image size and attack surface.

Non-Root Execution: The application runs under a dedicated low-privilege user for enhanced security.

Automated CI/CD: Fully automated pipeline that builds, tags, and pushes Docker images to Amazon ECR on every push to the main branch.

🛠 Tech Stack
Language: Python 3.11 (FastAPI)

Containerization: Docker

CI/CD: GitHub Actions

Cloud Provider: AWS (ECR, IAM, STS)

Authentication: OIDC (Identity Federation)

🔐 Security Highlights
Passwordless AWS Authentication
Instead of using static AWS_ACCESS_KEY_ID, this project leverages Identity Federation. GitHub Actions assumes a specific IAM Role dynamically via a short-lived token. This aligns with the Principle of Least Privilege.

Docker Multi-stage Builds
The build process is split into two stages:

Builder: Installs dependencies and compiles assets.

Runtime: Copies only the necessary artifacts, resulting in a tiny, secure image (based on python-slim).

⚙️ How It Works
Developer pushes code to the main branch.

GitHub Actions triggers the workflow.

The workflow requests a temporary token from AWS STS.

Docker builds the image using the local Dockerfile.

The image is tagged and pushed to Amazon Elastic Container Registry (ECR).

(Optional) The new image is ready to be pulled by AWS EC2, ECS, or EKS.

👨‍💻 Author
Blahodir Cloud & DevOps Enthusiast based in Norway
