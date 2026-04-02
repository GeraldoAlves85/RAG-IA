#!/bin/bash

echo "🚀 Iniciando deploy manual..."

# Verificar se docker está rodando
docker ps > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ Docker não está rodando"
    exit 1
fi

# Build das imagens
echo "📦 Buildando imagens..."
docker build -t rag-backend:latest ./backend
docker build -t rag-frontend:latest ./frontend

# Testar localmente
echo "🧪 Testando localmente..."
docker run --rm rag-backend:latest npm test

# Se tiver Docker Hub configurado
if [ -n "$DOCKER_USERNAME" ]; then
    echo "🐳 Fazendo push para Docker Hub..."
    docker tag rag-backend:latest $DOCKER_USERNAME/rag-backend:latest
    docker tag rag-frontend:latest $DOCKER_USERNAME/rag-frontend:latest
    docker push $DOCKER_USERNAME/rag-backend:latest
    docker push $DOCKER_USERNAME/rag-frontend:latest
fi

echo "✅ Deploy concluído!"
