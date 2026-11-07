
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
## 9. Lab-Verified Troubleshooting and Verification

### Named Volume Permission Issue

During initial container testing, the application could not write its visit counter to the mounted data directory.

The issue was caused by directory ownership and permissions when the named volume was mounted.

The Dockerfile was corrected to create the application data directory and assign ownership to the non-root application user:

`RUN mkdir -p /app/data && chown -R appuser:appuser /app`

The application continues to run as the non-root `appuser`.

**Verification:**

`curl http://localhost:5000/visit`

`docker compose restart web`

`curl http://localhost:5000/visit`

The visit counter continued across the container restart, confirming named-volume persistence.

### Docker Socket Permission Issue in Jenkins

The Jenkins agent initially could not access the Docker daemon.

The socket was owned by `root:docker`. The dedicated agent account was added to the Docker group and its process was restarted to receive the updated group membership.

Verification:

`sudo -u jenkins-agent id`

`sudo -u jenkins-agent docker ps`

The agent successfully accessed Docker after its group membership was refreshed.

**Security consideration:** Docker group membership provides effectively root-equivalent host access. Do not grant it to untrusted build accounts or expose the Docker daemon through an unauthenticated network connection.

### Application Startup Readiness

During the Jenkins Docker pipeline, an initial health request briefly failed while the application was starting.

The pipeline used a bounded retry loop before declaring the health check unsuccessful.

For local diagnosis:

`docker compose ps`

`docker compose logs --tail=100 web`

`curl -fsS http://localhost:5000/health`

Check container state and application logs before changing configuration.

### Compose Cleanup Verification

The Jenkins integration pipeline used a separate Compose project name and host port to avoid colliding with the manually running application and Jenkins controller.

After the pipeline completed, its Compose resources were removed.

For local cleanup, inspect the resources first:

`docker compose ps`

`docker compose down`

`docker compose ps -a`

Do not use `docker compose down -v` unless deletion of the named volume and its persistent application data is intended.

### Jenkins Docker Pipeline Artifacts

The Jenkins Docker pipeline successfully built the image, started the application, and tested its endpoints.

The archived reports were:

- `docker-reports/home-response.json`
- `docker-reports/health-response.json`
- `docker-reports/visit-response.json`

These artifacts provide evidence of application responses captured during the Jenkins build.
