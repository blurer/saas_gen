#!/bin/bash

# Define your project name
PROJECT_NAME="your-project-name"

# Create the main project directory
mkdir $PROJECT_NAME && cd $PROJECT_NAME

# Create backend structure
mkdir -p backend/app/models backend/app/views backend/app/controllers backend/app/services backend/migrations backend/scripts backend/tests
touch backend/requirements.txt
echo "FROM python:3.8-slim" > backend/Dockerfile

# Create frontend structure
mkdir -p frontend/public frontend/src/components frontend/src/services frontend/src/hooks frontend/src/styles frontend/src/tests
touch frontend/package.json
echo "FROM node:alpine" > frontend/Dockerfile

# Create infra structure
mkdir -p infra/terraform infra/scripts

# Create CI/CD structure
mkdir -p ci-cd/github ci-cd/scripts

# Create docs structure
mkdir -p docs/adr

# Create the docker-compose file
cat <<EOF > docker-compose.yml
version: '3.8'
services:
  frontend:
    build: ./frontend
    ports:
      - "3000:3000"
  backend:
    build: ./backend
    ports:
      - "8000:8000"
EOF

# Create README.md and .gitignore
touch README.md
echo ".DS_Store" > .gitignore

echo "Project structure created successfully."

