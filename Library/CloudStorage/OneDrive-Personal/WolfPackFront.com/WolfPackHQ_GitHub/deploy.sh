#!/bin/bash

cd "/Users/dongrieb/Library/CloudStorage/OneDrive-Personal/WolfPackFront.com/WolfPackHQ_GitHub" || {
  echo "❌ Folder not found: OneDrive-Personal/WolfPackFront.com/WolfPackHQ_GitHub"
  exit 1
}

echo "🧠 [DG DEPLOY] – Staging changes from local Git repo..."

# Optional: Pull latest from remote
# git pull origin main

# Stage all changes
git add .

# Prompt for commit message
echo "🔐 Enter commit message:"
read COMMIT_MSG

# Commit changes
git commit -m "$COMMIT_MSG"

# Push to GitHub
echo "📦 Pushing to GitHub..."
git push origin main

# Trigger Vercel Deploy Hook
echo "🚀 Hitting Vercel Deploy Hook..."
curl -X POST https://api.vercel.com/v1/integrations/deploy/prj_6F0ujEc5M1xZOgMhtluNgBMeie0r/bIOmLCUT3G

# macOS desktop notification
osascript -e 'display notification "🔥 DG Deployed Successfully" with title "WolfpackFront Autodeploy" sound name "Submarine"'

echo "✅ All systems go. Deployed to production."
