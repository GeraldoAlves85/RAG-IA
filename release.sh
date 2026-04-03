#!/bin/bash

RELEASE_VERSION=$1

if [ -z "$RELEASE_VERSION" ]; then
    echo "Usage: ./release.sh <version>"
    echo "Example: ./release.sh v1.0.0"
    exit 1
fi

echo "Creating release: $RELEASE_VERSION"

# Validate version format
if [[ ! $RELEASE_VERSION =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: Version must follow semantic versioning (v1.2.3)"
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "Warning: You have uncommitted changes"
    git status -s
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Create tag
echo "Creating tag: $RELEASE_VERSION"
git tag -a "$RELEASE_VERSION" -m "Release $RELEASE_VERSION"

# Push tag to trigger pipeline
echo "Pushing tag to GitHub..."
git push origin "$RELEASE_VERSION"

echo ""
echo "Release created successfully!"
echo "Pipeline will automatically:"
echo "  1. Run code quality checks"
echo "  2. Execute tests"
echo "  3. Build and publish images"
echo "  4. Deploy to production"
echo "  5. Verify deployment"
echo ""
echo "Monitor progress at: https://github.com/GeraldoAlves85/RAG-IA/actions"
