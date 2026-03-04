# OmniLog AI 🧠🔍

An event-driven, microservices-based logging and analysis system.

## 📖 About The Project
OmniLog AI is a cloud-native platform designed to collect, aggregate, and analyze system logs using Artificial Intelligence. When an error or warning occurs in any of the connected modules, the AI-Analyzer automatically intercepts the log, queries an LLM (Large Language Model), and provides actionable troubleshooting steps via Telegram.

## 🏗️ Architecture Modules
This project follows a modular, microservices architecture:
1. **Micro-Barista (Generator 1):** A dummy backend simulating a coffee ordering system that randomly generates operational logs and errors.
2. **Smart Home (Generator 2):** A simulated IoT module generating sensor data and hardware warnings.
3. **Core Collector:** The central API gateway that ingests logs from all connected generators.
4. **AI-Analyzer:** The core worker that listens for critical logs, analyzes them via AI API, and sends alerts.

## 🛠️ Tech Stack (DevOps Roadmap)
- **Containerization:** Docker & Docker Compose
- **CI/CD:** GitHub Actions
- **Infrastructure as Code (IaC):** Terraform
- **Cloud Provider:** AWS
- **Orchestration:** Kubernetes (K8s)
- **Monitoring:** Prometheus & Grafana