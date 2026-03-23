# Day 1 - DevOps Foundations

## What I Did
- Installed WSL (Ubuntu)
- Installed Docker
- Ran first container (hello-world)
- Fixed Docker credential issue
- Installed Git
- Configured Git correctly
- Created GitHub repository
- Pushed first commit using Personal Access Token

## Key Learnings
- Containers stop after exit but are not deleted
- Git requires correct user.name and user.email configuration
- GitHub does not accept passwords, uses PAT instead
- Configuration mistakes can break tools

## Commands Learned
docker run hello-world
docker ps
docker ps -a
git init
git add .
git commit -m "message"
git push

## Mistakes & Fixes
- Docker credential error → fixed ~/.docker/config.json
- Wrong git config key → corrected to user.name
- GitHub authentication failed → used PAT

## Key Insight
DevOps is about debugging and understanding systems, not just running commands
