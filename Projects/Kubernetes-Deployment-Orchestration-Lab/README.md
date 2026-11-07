# Kubernetes Deployment & Orchestration Lab

## Overview

This project demonstrates deploying, managing, and monitoring a containerized Flask application using Kubernetes and Minikube.

It reuses the Docker image created in the **Docker Containerization Lab** and demonstrates core Kubernetes deployment, networking, configuration management, scaling, health monitoring, and operational capabilities.

The project also includes a Jenkins pipeline definition for Kubernetes deployment automation, using a dedicated ServiceAccount and namespace-scoped Role-Based Access Control (RBAC).

## Architecture

| Component | Configuration |
|---|---|
| Kubernetes cluster | Minikube |
| Cluster driver | Docker |
| Container runtime | containerd |
| Application | Flask |
| Application image | `docker-containerization-lab-web:latest` |
| Namespace | `devops-lab` |
| Deployment | `flask-app` |
| Initial replicas | 2 |
| Service | NodePort |
| Service port | 80 |
| Container port | 5000 |
| NodePort | 30080 |
| Autoscaling | Horizontal Pod Autoscaler |

### Application Architecture

```text
                   Developer
                       |
                       v
                 kubectl / Jenkins
                       |
                       v
                Minikube Cluster
                       |
                       v
                Namespace: devops-lab
                       |
             +---------+---------+
             |                   |
             v                   v
       Kubernetes Service    Deployment
         NodePort 30080       flask-app
                                  |
                         +--------+--------+
                         |        |        |
                         v        v        v
                       Pod 1    Pod 2   Additional
                                       Replicas
                         |
                         v
                    Flask App
                      :5000
                         |
                  Health Endpoint
                    /health

       ConfigMap ------> Application Configuration
       Secret ---------> Demo Environment Variable
       HPA ------------> Replica Scaling
       Metrics Server -> Resource Metrics
```

## Kubernetes Features

- Namespace isolation
- Deployment and Pod management
- NodePort Service
- ConfigMap-based application configuration
- Kubernetes Secret injection
- Readiness and liveness probes
- CPU and memory requests and limits
- Manual horizontal scaling
- Rolling updates
- Deployment rollback
- Metrics Server monitoring
- Horizontal Pod Autoscaler (HPA)
- Jenkins integration
- Namespace-scoped RBAC and least-privilege access

## Project Structure

```text
Kubernetes-Deployment-Orchestration-Lab/
├── Jenkinsfile
├── README.md
├── k8s/
│   ├── namespace.yaml
│   ├── configmap.yaml
│   ├── secret.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── hpa.yaml
│   └── jenkins-rbac.yaml
└── docs/
    ├── 01-architecture.md
    └── 02-kubernetes-operations.md
```

## Prerequisites

- Linux or WSL Ubuntu
- Docker Engine
- Minikube
- kubectl
- Existing Docker application image from the Docker Containerization Lab
- Jenkins and a configured Linux agent for pipeline integration

## Deployment

### 1. Start Minikube

Generic command:

```bash
minikube start --driver=docker
```

You can explicitly configure CPU, memory, and disk allocation:

```bash
minikube start --driver=docker --cpus=<number-of-cpus> --memory=<memory-in-mb> --disk-size=<disk-size>
```

Configuration used in this lab:

```bash
minikube start --driver=docker --cpus=2 --memory=3072 --disk-size=20g
```

These resource values are specific to the available resources in our WSL environment. Adjust them according to your machine.

### 2. Verify the Cluster

```bash
minikube status
kubectl get nodes -o wide
kubectl get pods -n kube-system
kubectl config current-context
```

### 3. Load the Local Docker Image

Load the application image into Minikube:

```bash
minikube image load docker-containerization-lab-web:latest
```

Verify:

```bash
minikube image ls | grep docker-containerization-lab-web
```

The Deployment uses `imagePullPolicy: IfNotPresent` to use the locally available image.

### 4. Apply Kubernetes Resources

Create the namespace:

```bash
kubectl apply -f k8s/namespace.yaml
```

Apply application configuration and the demonstration Secret:

```bash
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/secret.yaml
```

Deploy the application and expose it:

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

Enable Metrics Server:

```bash
minikube addons enable metrics-server
```

Apply the HPA:

```bash
kubectl apply -f k8s/hpa.yaml
```

### 5. Verify Deployment

```bash
kubectl get all -n devops-lab
kubectl get pods -n devops-lab -o wide
kubectl rollout status deployment/flask-app -n devops-lab
```

The initial Deployment is configured for two replicas.

## Access the Application

Start port-forwarding:

```bash
kubectl port-forward -n devops-lab service/flask-app-service 8081:80
```

Keep the command running and use another terminal.

Test the application:

```bash
curl http://localhost:8081/
```

Check application health:

```bash
curl http://localhost:8081/health
```

Expected response:

```json
{"status":"healthy"}
```

Check the visit counter:

```bash
curl http://localhost:8081/visit
```

Port 8081 is used for local testing because Jenkins already occupies port 8080 in this environment.

## Configuration and Secrets

The application uses a ConfigMap for non-sensitive configuration:

```bash
kubectl get configmap flask-app-config -n devops-lab -o yaml
```

Verify the application environment:

```bash
kubectl exec -n devops-lab deployment/flask-app -- printenv APP_ENV
```

Verify Secret injection without printing the value:

```bash
kubectl exec -n devops-lab deployment/flask-app -- sh -c 'test -n "$APP_DEMO_SECRET" && echo "Secret successfully injected"'
```

The Secret manifest contains a synthetic portfolio demonstration value only.

**Security considerations:**

- Kubernetes Secrets are base64-encoded by default; encoding does not provide encryption.
- Never put real credentials or production secrets in the demonstration manifest.
- Keep kubeconfig files, tokens, and private credentials outside source control.
- Use appropriate encryption-at-rest and secrets-management mechanisms in production.

## Scaling

Manually scale the Deployment:

```bash
kubectl scale deployment flask-app -n devops-lab --replicas=3
```

Check replica status:

```bash
kubectl get deployment flask-app -n devops-lab
kubectl get pods -n devops-lab
```

Check autoscaling:

```bash
kubectl get hpa -n devops-lab
```

The HPA is configured with:

- Minimum replicas: 2
- Maximum replicas: 4
- CPU utilization target: 70%

The HPA uses Metrics Server data to make scaling decisions. Manual scaling is useful for demonstrating Deployment operations, but the HPA may subsequently reconcile the replica count.

## Rolling Updates and Rollback

Update the application environment to trigger a rolling update:

```bash
kubectl set env deployment/flask-app -n devops-lab APP_ENV=staging
```

Check rollout status:

```bash
kubectl rollout status deployment/flask-app -n devops-lab
```

View rollout history:

```bash
kubectl rollout history deployment/flask-app -n devops-lab
```

Rollback:

```bash
kubectl rollout undo deployment/flask-app -n devops-lab
```

Verify the rollback:

```bash
kubectl rollout status deployment/flask-app -n devops-lab
```

## Monitoring

Check pods:

```bash
kubectl get pods -n devops-lab
```

Check Deployments:

```bash
kubectl get deployments -n devops-lab
```

Check Services:

```bash
kubectl get services -n devops-lab
```

Check HPA:

```bash
kubectl get hpa -n devops-lab
```

Check node resource usage:

```bash
kubectl top nodes
```

Check pod resource usage:

```bash
kubectl top pods -n devops-lab
```

Inspect application logs:

```bash
kubectl logs deployment/flask-app -n devops-lab
```

## Jenkins CI/CD Integration

The project includes a Jenkins pipeline definition in `Jenkinsfile`.

The pipeline is designed to:

1. Check out the Git repository.
2. Verify Kubernetes authentication.
3. Validate required Kubernetes permissions.
4. Validate Kubernetes manifests using server-side dry-run.
5. Apply application configuration and Kubernetes resources.
6. Wait for the Deployment rollout.
7. Collect Deployment, Pod, Service, and HPA information.
8. Port-forward the application.
9. Test the application health endpoint.
10. Archive build reports and clean the Jenkins workspace.

The pipeline runs on the Jenkins agent labelled:

```text
linux-agent
```

### Jenkins Kubernetes Authentication

A dedicated ServiceAccount is used:

```text
jenkins-deployer
```

It is configured in the `devops-lab` namespace.

The associated Role and RoleBinding are defined in:

```text
k8s/jenkins-rbac.yaml
```

Apply the RBAC configuration separately as a cluster administrator:

```bash
kubectl apply -f k8s/jenkins-rbac.yaml
```

The Jenkins identity receives only the permissions required for the deployment workflow.

Verify permissions:

```bash
kubectl auth can-i get pods -n devops-lab
kubectl auth can-i create deployments -n devops-lab
kubectl auth can-i create pods/portforward -n devops-lab
```

Verify restricted operations:

```bash
kubectl auth can-i delete deployments -n devops-lab
kubectl auth can-i get replicasets -n devops-lab
kubectl auth can-i get secrets -n devops-lab
kubectl auth can-i get nodes
```

The restricted operations should return `no`.

### Jenkins Agent Credentials

The agent's Kubernetes configuration is stored outside the repository:

```text
/home/jenkins-agent/.kube/config
```

The short-lived ServiceAccount token is stored separately:

```text
/home/jenkins-agent/.kube/token
```

The token expires after its configured lifetime. An administrator must renew it when necessary and update the agent's kubeconfig.

Never commit Kubernetes tokens, kubeconfig files, or cluster credentials to Git.

See `docs/02-kubernetes-operations.md` for the token renewal procedure and detailed Jenkins troubleshooting steps.

## Security Notes

- Application containers run as a non-root user through the existing Docker image.
- Kubernetes Secrets contain demonstration-only values.
- No production credentials are included.
- Resource requests and limits are configured.
- Jenkins uses a dedicated namespace-scoped ServiceAccount.
- Jenkins permissions follow the least-privilege principle.
- The Jenkins Kubernetes token is short-lived and stored outside the repository.
- The cluster runs locally through Minikube.
- No public Kubernetes API endpoint or Docker TCP socket is exposed for this lab.

## Troubleshooting

The following issues were encountered and resolved during implementation:

| Issue | Resolution |
|---|---|
| Minikube failed with 4096 MB memory allocation | Reduced allocation to 3072 MB for WSL |
| Local Docker image unavailable inside Minikube | Loaded image using `minikube image load` |
| Port 8080 already occupied | Used port 8081 for Kubernetes port-forwarding |
| Application data volume permission error | Corrected ownership of the application data directory in the Docker image |
| Resource metrics unavailable | Enabled Minikube Metrics Server |
| Jenkins agent could not access Kubernetes | Configured a dedicated kubeconfig and ServiceAccount |
| Jenkins RBAC permissions were broader than required | Restricted the Role and verified denied operations |
| Jenkins Kubernetes token expired | Generated a replacement short-lived token and updated kubeconfig |

Detailed symptoms, diagnosis, resolution, commands, and verification steps are documented in:

- `docs/01-architecture.md`
- `docs/02-kubernetes-operations.md`

## Cleanup

Delete the lab namespace and its resources:

```bash
kubectl delete namespace devops-lab
```

Stop Minikube:

```bash
minikube stop
```

To remove the local cluster entirely:

```bash
minikube delete
```

**Warning:** Deleting the Minikube cluster removes its Kubernetes workloads and cluster-local resources.

## Learning Outcomes

This project demonstrates practical Kubernetes and DevOps skills, including:

- Kubernetes cluster setup and administration.
- Container orchestration.
- Deployments, Pods, and Services.
- ConfigMaps and Secrets.
- Readiness and liveness probes.
- Resource requests and limits.
- Manual and automatic scaling.
- Rolling deployments and rollback.
- Metrics Server and HPA.
- Namespace-scoped RBAC.
- Jenkins-to-Kubernetes integration.
- Short-lived ServiceAccount token management.
- Troubleshooting and operational verification.

## Documentation

| Document | Description |
|---|---|
| `docs/01-architecture.md` | Architecture, components, and request flow |
| `docs/02-kubernetes-operations.md` | Deployment, operations, monitoring, troubleshooting, and verification |
