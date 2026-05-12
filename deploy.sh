#!/bin/bash
set -e
cd "$(dirname "$0")"
echo "🔨 Building Hugo site..."
hugo --gc --minify
echo "✅ Build complete: public/"
if git remote -v | grep -q origin; then
    echo "📤 Pushing to GitHub..."
    git add -A
    git commit -m "site: auto-update $(date +%Y-%m-%d)"
    git push origin main
    echo "✅ Deployed!"
else
    echo "⚠️  No git remote configured."
    echo "   Create repo: gh repo create outdoor-gear-blog --public"
    echo "   Then: git remote add origin <url> && git push -u origin main"
fi
