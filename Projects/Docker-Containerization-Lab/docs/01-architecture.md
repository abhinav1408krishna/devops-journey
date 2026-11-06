
# Docker Containerization Architecture

## 1. Architecture Overview

The project uses Docker Compose to run a Python Flask application inside a custom Docker container.

The architecture consists of:

1. Flask application
2. Custom Docker image
3. Docker container
4. Docker bridge network
5. Named persistent volume
6. Docker health check

## 2. Application Flow

```text
Developer / Host Machine
          |
          | HTTP :5000
          v
    Docker Host Port
          |
          v
    Docker Container
          |
          v
      Flask App
       /  |  \
      /   |   \
     /    |    \
    /     |     \
   /      |      \
  /       |       \
Home   Health    Visit
                    |
                    v
              /app/data
                    |
                    v
             Named Volume
```

## 3. Dockerfile Design

The Dockerfile:

- Uses the Python 3.12 slim base image.
- Sets `/app` as the working directory.
- Installs Flask dependencies.
- Copies application files.
- Creates a dedicated non-root user.
- Creates the persistent-data mount point with appropriate ownership.
- Exposes port 5000.
- Configures a container health check.
- Starts the Flask application.

## 4. Docker Compose Design

The Compose configuration defines:

### Web service

Builds the image from the local Dockerfile and maps host port 5000 to container port 5000.

### Network

Uses a dedicated bridge network named `docker-lab-network` within the Compose project.

### Volume

Uses the named volume `app-data`, mounted at `/app/data`.

This allows application data to survive container restarts and recreation.

## 5. Health Monitoring

Docker periodically sends an HTTP request to:

```text
http://127.0.0.1:5000/health
```

A successful response indicates that the application is healthy.

## 6. Persistence

The `/visit` endpoint increments a counter stored in:

```text
/app/data/visits.txt
```

The named volume retains this data independently of the container lifecycle.

## 7. Security

The application runs as `appuser`, rather than root.

The data directory is created and assigned to the application user during image construction.
