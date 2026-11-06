
# Docker Operations Guide

## 1. Build the Image

```bash
docker compose build
```

Build and start in one command:

```bash
docker compose up -d --build
```

## 2. Container Management

List running containers:

```bash
docker compose ps
```

Stop containers:

```bash
docker compose stop
```

Start containers:

```bash
docker compose start
```

Restart containers:

```bash
docker compose restart
```

Remove containers and network:

```bash
docker compose down
```

## 3. Application Testing

```bash
curl http://localhost:5000/
curl http://localhost:5000/health
curl http://localhost:5000/visit
```

## 4. Logs and Inspection

View application logs:

```bash
docker compose logs -f web
```

Inspect container health:

```bash
docker inspect --format='{{.State.Health.Status}}' docker-lab-web
```

Inspect container processes:

```bash
docker top docker-lab-web
```

## 5. Image Management

List images:

```bash
docker images
```

Inspect image:

```bash
docker image inspect docker-containerization-lab-web
```

## 6. Volume Management

List volumes:

```bash
docker volume ls
```

Inspect the project volume:

```bash
docker volume inspect docker-containerization-lab_app-data
```

The named volume persists when the container is stopped or removed.

**Warning:** `docker compose down -v` deletes the Compose-managed named volume and its stored data.

## 7. Network Management

List networks:

```bash
docker network ls
```

Inspect the project network:

```bash
docker network inspect docker-containerization-lab_docker-lab-network
```

## 8. Cleanup

Stop and remove containers and the Compose network:

```bash
docker compose down
```

Remove the volume only when its data is no longer required:

```bash
docker compose down -v
```
