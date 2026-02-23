#!/bin/bash
# Obsidian Vault Auto Sync Script

VAULT_DIR="$HOME/obsidian-vault"
cd "$VAULT_DIR" || exit 1

# Pull latest changes
echo "📥 Pulling from remote..."
git pull origin main

# Add all changes
git add -A

# Check if there are changes to commit
if git diff --cached --quiet; then
    echo "✅ No changes to commit"
else
    # Commit with timestamp
    echo "📤 Committing changes..."
    git commit -m "Auto sync: $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Push to remote
    echo "📤 Pushing to remote..."
    git push origin main
    echo "✅ Sync complete!"
fi
