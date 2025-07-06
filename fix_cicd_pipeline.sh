#!/bin/bash

# Set working directory
cd /Users/dongrieb/Library/CloudStorage/OneDrive-Personal/WolfPackFront.com/WolfPackHQ_GitHub || {
  echo "❌ Cannot locate repo directory. Exiting."
  exit 1
}

echo "🧠 [FIX CI/CD] – Rebuilding and syncing pipeline..."

# Stage correct files
git add index.html elon-avatar.png wolfpack-logo.png deploy.sh vercel.json .gitignore

# Commit with a default message (change if needed)
git commit -m "🚨 Fix CI/CD: force sync deploy pipeline"

# Push with force to override issues
git push origin main --force

# Hit Vercel deploy hook
curl -X POST https://api.vercel.com/v1/integrations/deploy/prj_6F0ujEc5M1xZOgMhtluNgBMeie0r/bIOmLCUT3G

echo "✅ CI/CD Fired. Check https://wolfpackfront.com in 2 minutes."
