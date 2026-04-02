#!/bin/bash
echo " Iniciando ambiente..."

# Sobe containers
docker-compose up -d

# Aguarda Ollama iniciar
echo " Aguardando Ollama iniciar..."
sleep 10

# Baixa modelo (só precisa uma vez)
echo " Baixando modelo llama3.2 (leve e rápido)..."
docker exec ollama ollama pull llama3.2

echo " Ambiente pronto!"
echo " Frontend: http://localhost:8080"
echo " API: http://localhost:3000"
echo " Ollama: http://localhost:11434"
