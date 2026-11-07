
# Kubernetes Architecture

## 1. Overview

The lab deploys an existing Flask Docker image to a local Kubernetes cluster running through Minikube.

Kubernetes manages application replicas, service discovery, configuration, health checks, and scaling.

## 2. Architecture Components

| Component | Purpose |
|---|---|
| Minikube | Local Kubernetes cluster |
| Deployment | Manages Flask application replicas |
| ReplicaSet | Maintains the desired number of pods |
| Pods | Run application containers |
| NodePort Service | Exposes the application |
| ConfigMap | Supplies non-sensitive configuration |
| Secret | Supplies demonstration-only sensitive configuration |
| Metrics Server | Collects CPU and memory metrics |
| HPA | Adjusts replica count based on CPU utilization |

## 3. Application Request Flow

1. A client sends a request to the exposed application endpoint.
2. The Kubernetes Service receives traffic on port 80.
3. The Service forwards traffic to an available Flask pod on port 5000.
4. The Flask application processes the request and returns a response.

## 4. Configuration Management

The ConfigMap provides:
- APP_ENV
- APP_MESSAGE

The Kubernetes Secret provides:
- APP_DEMO_SECRET

The Secret contains synthetic demonstration data only.

## 5. Deployment Strategy

The Deployment uses:
- Two baseline replicas
- RollingUpdate strategy
- maxSurge: 1
- maxUnavailable: 0

This allows Kubernetes to replace pods gradually during updates.

## 6. Health Monitoring

Readiness probes determine whether a pod can receive traffic.

Liveness probes determine whether a container should be restarted.

Both probes use the application's `/health` endpoint.

## 7. Resource Management

Each container has:
- CPU request: 50m
- Memory request: 64Mi
- CPU limit: 250m
- Memory limit: 128Mi

## 8. Autoscaling

The Horizontal Pod Autoscaler targets 70% average CPU utilization.

- Minimum replicas: 2
- Maximum replicas: 4

Metrics Server supplies the resource metrics used by HPA.
