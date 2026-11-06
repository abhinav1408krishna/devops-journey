
# Docker Containerization Lab

## Overview

This project demonstrates containerizing a Python Flask application using Docker and Docker Compose.

It covers custom image creation, container lifecycle management, health checks, persistent storage, networking, and container security.

## Architecture

The Flask application runs inside a Docker container built from a custom Dockerfile.

Docker Compose manages the application container, network, and persistent named volume.

## Project Structure

```text
Docker-Containerization-Lab/
├── app/
│   ├── app.py
│   └── requirements.txt
├── docs/
│   ├── 01-architecture.md
│   └── 02-docker-operations.md
├── .dockerignore
├── Dockerfile
├── compose.yaml
└── README.md
```

## Technologies

- Docker Engine
- Docker Compose
- Python 3.12
- Flask
- Linux / Ubuntu

## Application Endpoints

| Endpoint | Description |
|---|---|
| `/` | Application information |
| `/health` | Container health check |
| `/visit` | Persistent visit counter |

## Getting Started

### Build and start

```bash
docker compose up -d --build
```

### Check container status

```bash
docker compose ps
```

### Test application

```bash
curl http://localhost:5000/
curl http://localhost:5000/health
curl http://localhost:5000/visit
```

### View logs

```bash
docker compose logs -f web
```

### Stop application

```bash
docker compose down
```

The named volume is retained when using `docker compose down`.

## Docker Features Demonstrated

- Custom Docker image creation
- Dockerfile instructions and image layers
- Non-root container execution
- Docker Compose orchestration
- Container health checks
- Bridge networking
- Named volumes and persistent data
- Container restart policies
- `.dockerignore` configuration

## Persistence Verification

The `/visit` endpoint stores its counter in `/app/data/visits.txt`.

The application uses a named Docker volume mounted at `/app/data`.

The counter was verified to survive a container restart.

## Security Practices

- Application runs as a non-root user.
- Dependencies are installed without retaining pip cache.
- Environment configuration is separated from application code.
- `.dockerignore` excludes local and sensitive files.
- Persistent storage is isolated using a named volume.

## Learning Outcomes

This lab demonstrates how to package, run, monitor, and manage a containerized application using Docker and Docker Compose.
