#!/bin/bash

echo "🔍 Verificando Dockerfiles..."

# Verificar backend Dockerfile
if grep -q "FROM node:18-alpine" backend/Dockerfile; then
    echo "✅ Backend Dockerfile OK"
else
    echo "❌ Backend Dockerfile incorreto"
    cat backend/Dockerfile
    exit 1
fi

# Verificar frontend Dockerfile
if grep -q "FROM nginx:alpine" frontend/Dockerfile; then
    echo "✅ Frontend Dockerfile OK"
else
    echo "❌ Frontend Dockerfile incorreto"
    cat frontend/Dockerfile
    exit 1
fi

echo "🎉 Todos os Dockerfiles estão corretos!"
