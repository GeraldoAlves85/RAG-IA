# 🤖 Assistente RAG com Ollama, Docker e CI/CD

![CI/CD Pipeline](https://github.com/GeraldoAlves85/RAG-IA/actions/workflows/ci-cd.yml/badge.svg)
![Docker](https://img.shields.io/badge/Docker-Container-blue)
![Ollama](https://img.shields.io/badge/Ollama-LLM-green)
![Node.js](https://img.shields.io/badge/Node.js-18.x-green)
![License](https://img.shields.io/badge/License-MIT-yellow)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)

## 📋 Sobre o Projeto

**Assistente de IA local** utilizando Ollama (Llama 3.2) containerizado com Docker, com pipeline CI/CD profissional via GitHub Actions.

### 🎯 Características Principais

- ✅ **IA Local**: Ollama rodando Llama 3.2 sem necessidade de internet
- ✅ **Containerizado**: Docker e Docker Compose para fácil deploy
- ✅ **API REST**: Backend Node.js/Express para integrações
- ✅ **Frontend Moderno**: Interface responsiva com design contemporâneo
- ✅ **CI/CD Profissional**: GitHub Actions com build, teste e deploy automatizados
- ✅ **Código Aberto**: Totalmente personalizável e extensível

### 📊 Status do Projeto

| Métrica | Status |
|---------|--------|
| Build | ✅ Passando |
| Testes | ✅ Passando |
| Docker | ✅ Configurado |
| CI/CD | ✅ Ativo |
| Documentação | ✅ Completa |

## 🏗️ Arquitetura do Sistema


## 🐳 Docker Hub

[![Docker Pulls](https://img.shields.io/docker/pulls/geraldoti2022/rag-ia-github-actions)](https://hub.docker.com/r/geraldoti2022/rag-ia-github-actions)

### Imagens disponíveis

```bash
# Backend API
docker pull geraldoti2022/rag-ia-github-actions:backend
docker run -d -p 3000:3000 geraldoti2022/rag-ia-github-actions:backend

# Frontend Web  
docker pull geraldoti2022/rag-ia-github-actions:frontend
docker run -d -p 8080:80 geraldoti2022/rag-ia-github-actions:frontend

## CI/CD Pipeline Stages

The pipeline follows enterprise-grade stages:

| Stage | Description | Trigger |
|-------|-------------|---------|
| Code Quality | Validates Dockerfiles, dependencies, and configuration | Always |
| Tests | Runs unit and integration tests | Always |
| Build & Publish | Creates and pushes Docker images | Main/Tags |
| Deployment | Deploys to target environment | Main/Tags/Manual |
| Verification | Validates deployment health | After Deployment |
| Reporting | Generates execution report | Always |

### Deployment Triggers

- **Push to main**: Automatic deployment to staging
- **Tag creation**: Automatic deployment to production
- **Manual trigger**: Select environment via workflow_dispatch

### Quick Release

```bash
./release.sh v1.0.0
