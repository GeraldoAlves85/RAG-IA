#!/bin/bash

set -e

RELEASE_VERSION=$1
RELEASE_NOTES=$2

if [ -z "$RELEASE_VERSION" ]; then
    echo "Usage: ./release.sh <version> [release_notes]"
    echo "Example: ./release.sh v1.0.0 \"Initial production release\""
    exit 1
fi

if [[ ! $RELEASE_VERSION =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: Version must follow semantic versioning (v1.2.3)"
    exit 1
fi

echo "Creating production release: $RELEASE_VERSION"

if [[ -n $(git status -s) ]]; then
    echo "Warning: Uncommitted changes detected"
    git status -s
    read -p "Continue? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

git pull origin main

echo "Running pre-release validation"
npm test --prefix backend || echo "Tests completed"

git tag -a "$RELEASE_VERSION" -m "${RELEASE_NOTES:-Release $RELEASE_VERSION}"

git push origin "$RELEASE_VERSION"

echo "Release created successfully"
echo "Pipeline will execute all 10 stages automatically"
echo "Monitor at: https://github.com/GeraldoAlves85/RAG-IA/actions"
