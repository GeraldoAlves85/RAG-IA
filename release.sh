#!/bin/bash

# Script para criar uma nova release
VERSION=$1

if [ -z "$VERSION" ]; then
    echo "Uso: ./release.sh v1.0.0"
    exit 1
fi

echo "📦 Criando release $VERSION..."

# Atualizar versão no package.json (se existir)
if [ -f backend/package.json ]; then
    cd backend
    npm version $VERSION --no-git-tag-version
    cd ..
fi

# Commit das alterações
git add .
git commit -m "release: $VERSION"

# Criar tag
git tag -a "$VERSION" -m "Release $VERSION"

# Push para GitHub
git push origin main
git push origin "$VERSION"

echo "✅ Release $VERSION criada!"
echo "🔗 O deploy será feito automaticamente via GitHub Actions"
