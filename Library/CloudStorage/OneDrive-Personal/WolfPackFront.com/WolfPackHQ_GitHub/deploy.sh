#!/bin/bash

cd /Users/dongrieb/Sites/WolfPackFront || {
  echo "❌ Folder not found: /Users/dongrieb/Sites/WolfPackFront"
  exit 1
}

echo "🧠 [DG DEPLOY] – Staging changes from local Git repo..."

# Optional: Pull latest remote updates first
git pull origin main --rebase

# Stage all changes
git add .

# Prompt for commit message
echo "🔐 Enter commit message:"
read COMMIT_MSG

# Commit if there's anything to commit
git diff --cached --quiet || git commit -m "$COMMIT_MSG"

# Push to GitHub
echo "📦 Pushing to GitHub..."
git push origin main

# Trigger Vercel deploy hook
echo "🚀 Hitting Vercel Deploy Hook..."
curl -X POST https://api.vercel.com/v1/integrations/deploy/prj_6F0ujEc5M1xZOgMhtluNgBMeie0r/bIOmLCUT3G

# Desktop alert
osascript -e 'display notification "🔥 DG Deployed Successfully" with title "WolfpackFront Autodeploy" sound name "Submarine"'

echo "✅ All systems go. Deployed to production."
