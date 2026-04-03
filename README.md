# Assistente RAG com Ollama, Docker e CI/CD

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


## 🚀 Começando

### Pré-requisitos

- **Docker** (20.10+)
- **Docker Compose** (2.0+)
- **Git** (para clonar o repositório)
- **8GB+ RAM** (recomendado para rodar o Ollama)

### Instalação Rápida

```bash
# 1. Clonar o repositório
git clone https://github.com/GeraldoAlves85/RAG-IA.git
cd RAG-IA

# 2. Subir os containers
docker compose up -d

# 3. Baixar o modelo Ollama (primeira execução)
docker exec -it ollama ollama pull llama3.2

# 4. Acessar a aplicação
# Abra http://localhost:8080 no navegador

# Instalar WSL2
wsl --install

# Instalar Docker Desktop
# Baixar em: https://www.docker.com/products/docker-desktop

# Clonar e rodar
git clone https://github.com/GeraldoAlves85/RAG-IA.git
cd RAG-IA
docker compose up -d

# Instalar Docker
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER

# Instalar Docker Compose
sudo apt install docker-compose-plugin

# Clonar e rodar
git clone https://github.com/GeraldoAlves85/RAG-IA.git
cd RAG-IA
docker compose up -d
# Instalar Docker Desktop
brew install --cask docker

# Clonar e rodar
git clone https://github.com/GeraldoAlves85/RAG-IA.git
cd RAG-IA
docker compose up -d

# Ver status dos containers
docker compose ps

# Ver logs em tempo real
docker compose logs -f

# Ver logs específicos
docker compose logs backend
docker compose logs frontend
docker compose logs ollama

# Parar todos os containers
docker compose down

# Reconstruir e subir
docker compose up -d --build

# Limpar volumes e dados
docker compose down -v

# Ver uso de recursos
docker stats

curl http://localhost:3000/health

{
  "status": "OK",
  "ollama": "verificando..."
}


curl -X POST http://localhost:3000/ask \
  -H "Content-Type: application/json" \
  -d '{"question":"O que é Docker?"}'

  # Pergunta sobre tecnologia
curl -X POST http://localhost:3000/ask \
  -H "Content-Type: application/json" \
  -d '{"question":"Explique o que é Kubernetes"}'

# Pergunta sobre ciência
curl -X POST http://localhost:3000/ask \
  -H "Content-Type: application/json" \
  -d '{"question":"Como funciona a fotossíntese?"}'

# Pergunta sobre programação
curl -X POST http://localhost:3000/ask \
  -H "Content-Type: application/json" \
  -d '{"question":"O que é uma closure em JavaScript?"}'

 
# Pipeline Update Thu Apr  2 21:58:38 -03 2026
