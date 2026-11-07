# Kubernetes Deployment & Orchestration Lab — Operations Guide

## 1. Overview

This guide documents the practical commands used to operate, deploy, inspect, troubleshoot, and validate the Kubernetes application in this lab.

The lab uses:

- Minikube with the Docker driver
- Kubernetes and `kubectl`
- A locally built Docker application image
- A Deployment with two initial replicas
- A NodePort Service
- ConfigMaps and Secrets
- Readiness and liveness probes
- Resource requests and limits
- Metrics Server and Horizontal Pod Autoscaler (HPA)
- Jenkins integration using a dedicated ServiceAccount and namespace-scoped RBAC

The Kubernetes namespace is `devops-lab`.

## 2. Start and Inspect the Cluster

### 2.1 Start Minikube — Generic Command

The general command to start Minikube with the Docker driver is:

```bash
minikube start --driver=docker
```

Minikube uses default resource allocations when explicit values are not supplied.

You can also specify CPU, memory, and disk resources:

```bash
minikube start --driver=docker --cpus=<number-of-cpus> --memory=<memory-in-mb> --disk-size=<disk-size>
```

For example:

```bash
minikube start --driver=docker --cpus=2 --memory=3072 --disk-size=20g
```

### 2.2 Configuration Used in This Lab

The following resource configuration was used in our WSL environment:

| Setting | Value |
|---|---|
| Driver | Docker |
| CPUs | 2 |
| Memory | 3072 MB |
| Disk | 20 GB |
| Kubernetes version | 1.37.0 |

These values were selected according to the available resources in the WSL environment. Adjust them according to your machine's available CPU, memory, and disk capacity.

The initial attempt with 4096 MB memory failed because the available WSL memory limit was lower than requested. Reducing the allocation to 3072 MB allowed Minikube to start successfully.

### 2.3 Verify Minikube Status

```bash
minikube status
```

### 2.4 Verify Kubernetes Nodes

```bash
kubectl get nodes -o wide
```

### 2.5 Inspect System Workloads

```bash
kubectl get pods -n kube-system
```

### 2.6 Check the Active Kubernetes Context

```bash
kubectl config current-context
```

Expected context:

```text
minikube
```

### 2.7 Check Kubernetes Versions

```bash
kubectl version
```

## 3. Load the Application Image into Minikube

The application image is built locally in the Docker Containerization Lab.

Load it into Minikube:

```bash
minikube image load docker-containerization-lab-web:latest
```

Verify the image is available:

```bash
minikube image ls | grep docker-containerization-lab-web
```

The Kubernetes Deployment uses:

```yaml
image: docker-containerization-lab-web:latest
imagePullPolicy: IfNotPresent
```

This allows Minikube to use the locally loaded image without pulling it from a remote registry.

## 4. Deploy Kubernetes Resources

Apply the namespace:

```bash
kubectl apply -f k8s/namespace.yaml
```

Apply the ConfigMap:

```bash
kubectl apply -f k8s/configmap.yaml
```

Apply the demo Secret:

```bash
kubectl apply -f k8s/secret.yaml
```

Apply the Deployment:

```bash
kubectl apply -f k8s/deployment.yaml
```

Apply the Service:

```bash
kubectl apply -f k8s/service.yaml
```

Apply the Horizontal Pod Autoscaler:

```bash
kubectl apply -f k8s/hpa.yaml
```

Check the deployed resources:

```bash
kubectl get all -n devops-lab
```

Check the Deployment rollout:

```bash
kubectl rollout status deployment/flask-app -n devops-lab
```

Check the pods:

```bash
kubectl get pods -n devops-lab -o wide
```

The initial Deployment configuration requests two replicas.

## 5. Inspect Application Resources

Inspect the Deployment:

```bash
kubectl describe deployment flask-app -n devops-lab
```

Inspect the Service:

```bash
kubectl describe service flask-app-service -n devops-lab
```

Inspect a pod:

```bash
kubectl describe pod <pod-name> -n devops-lab
```

View application logs:

```bash
kubectl logs deployment/flask-app -n devops-lab
```

View logs from a specific pod:

```bash
kubectl logs <pod-name> -n devops-lab
```

Check the Service endpoints:

```bash
kubectl get endpoints flask-app-service -n devops-lab
```

Check the ConfigMap:

```bash
kubectl get configmap flask-app-config -n devops-lab -o yaml
```

## 6. Access the Application

The application is exposed through a NodePort Service.

Inspect the Service:

```bash
kubectl get service flask-app-service -n devops-lab
```

The configured NodePort is `30080`.

For local testing, use port-forwarding:

```bash
kubectl port-forward -n devops-lab service/flask-app-service 8081:80
```

Keep this terminal running while testing from another terminal.

Check the application:

```bash
curl http://localhost:8081/
```

Check the health endpoint:

```bash
curl http://localhost:8081/health
```

Expected health response:

```json
{"status":"healthy"}
```

Check the visit counter:

```bash
curl http://localhost:8081/visit
```

The visit endpoint returns a JSON response containing the visit count.

Stop port-forwarding with `Ctrl+C`.

## 7. Inspect Configuration and Secrets

The application receives configuration from the ConfigMap.

Inspect the ConfigMap:

```bash
kubectl describe configmap flask-app-config -n devops-lab
```

Check the environment variable inside a running pod:

```bash
kubectl exec -n devops-lab deployment/flask-app -- printenv APP_ENV
```

Check that the demo Secret is injected without displaying its value:

```bash
kubectl exec -n devops-lab deployment/flask-app -- sh -c 'test -n "$APP_DEMO_SECRET" && echo "Secret successfully injected"'
```

The lab Secret contains a synthetic portfolio demonstration value only.

**Security considerations:**

- Kubernetes Secret data is base64-encoded; base64 encoding is not encryption.
- Do not store real credentials or production secrets in this demonstration manifest.
- Do not print secret values into terminal logs or Jenkins build output.
- Use an appropriate secrets-management solution and encryption-at-rest configuration for production environments.
- Keep real credentials, kubeconfig files, tokens, and private key material outside the Git repository.

## 8. Scale the Deployment

Scale the application to three replicas:

```bash
kubectl scale deployment flask-app --replicas=3 -n devops-lab
```

Watch the pods:

```bash
kubectl get pods -n devops-lab -w
```

Check the Deployment:

```bash
kubectl get deployment flask-app -n devops-lab
```

Expected result after scaling:

```text
READY   UP-TO-DATE   AVAILABLE
3/3     3            3
```

Stop watching with `Ctrl+C`.

Note: The HPA also manages replica counts. Manual scaling is useful for demonstrating the Deployment operation, but the HPA may later reconcile the replica count according to its configured minimum, maximum, and metrics.

## 9. Perform a Rolling Update

Change an environment variable to trigger a new Deployment revision:

```bash
kubectl set env deployment/flask-app APP_ENV=staging -n devops-lab
```

Watch the rollout:

```bash
kubectl rollout status deployment/flask-app -n devops-lab
```

Inspect the rollout history:

```bash
kubectl rollout history deployment/flask-app -n devops-lab
```

Check the pods:

```bash
kubectl get pods -n devops-lab
```

The Deployment uses a rolling-update strategy to replace pods gradually.

## 10. Roll Back a Deployment

Undo the most recent rollout:

```bash
kubectl rollout undo deployment/flask-app -n devops-lab
```

Verify the rollback:

```bash
kubectl rollout status deployment/flask-app -n devops-lab
```

Inspect the rollout history:

```bash
kubectl rollout history deployment/flask-app -n devops-lab
```

Check the running pods:

```bash
kubectl get pods -n devops-lab
```

## 11. Monitor Resource Usage

Enable the Metrics Server addon:

```bash
minikube addons enable metrics-server
```

Check the addon:

```bash
kubectl get pods -n kube-system | grep metrics-server
```

Inspect node metrics:

```bash
kubectl top nodes
```

Inspect pod metrics:

```bash
kubectl top pods -n devops-lab
```

The Deployment defines CPU and memory requests and limits.

Inspect them:

```bash
kubectl describe deployment flask-app -n devops-lab
```

## 12. Inspect Horizontal Pod Autoscaling

Apply the HPA:

```bash
kubectl apply -f k8s/hpa.yaml
```

Inspect its configuration and current metrics:

```bash
kubectl get hpa -n devops-lab
```

Get additional details:

```bash
kubectl describe hpa flask-app-hpa -n devops-lab
```

The lab HPA configuration uses:

- Minimum replicas: 2
- Maximum replicas: 4
- Target average CPU utilization: 70%

The HPA depends on available resource metrics. If metrics are unavailable, check the Metrics Server before troubleshooting autoscaling itself.

## 13. Jenkins Integration

The lab includes a Jenkins pipeline defined in:

```text
Jenkinsfile
```

The pipeline runs on the Jenkins agent labelled `linux-agent`.

It performs these operations:

1. Checks out the repository.
2. Verifies Kubernetes authentication and required permissions.
3. Validates selected manifests using server-side dry-run.
4. Applies the ConfigMap, Deployment, Service, and HPA.
5. Waits for the Deployment rollout.
6. Collects Kubernetes resource information.
7. Port-forwards the application and checks its health endpoint.
8. Archives reports and cleans the Jenkins workspace.

The pipeline intentionally does not apply the namespace, demo Secret, or Jenkins RBAC manifest. These are prepared separately by the cluster administrator.

### 13.1 Jenkins ServiceAccount

The dedicated ServiceAccount is:

```text
jenkins-deployer
```

It is created in:

```text
devops-lab
```

Its Role and RoleBinding are defined in:

```text
k8s/jenkins-rbac.yaml
```

Apply the RBAC configuration:

```bash
kubectl apply -f k8s/jenkins-rbac.yaml
```

### 13.2 Verify Jenkins Permissions

Run the following checks:

```bash
kubectl auth can-i get pods -n devops-lab
kubectl auth can-i create deployments -n devops-lab
kubectl auth can-i create pods/portforward -n devops-lab
```

These permissions are required by the pipeline.

Check that unnecessary permissions are denied:

```bash
kubectl auth can-i delete deployments -n devops-lab
kubectl auth can-i get replicasets -n devops-lab
kubectl auth can-i get secrets -n devops-lab
kubectl auth can-i get nodes
```

The expected results for these restricted operations are `no`.

The Jenkins Role is namespace-scoped. It does not grant cluster-wide administrative access.

### 13.3 Jenkins Agent kubeconfig

The Jenkins agent uses a separate kubeconfig stored outside the repository:

```text
/home/jenkins-agent/.kube/config
```

The associated token is stored separately at:

```text
/home/jenkins-agent/.kube/token
```

The `.kube` directory and credential files must be accessible only to the Jenkins agent account.

The Jenkins pipeline references this kubeconfig through its `KUBECONFIG` environment variable.

### 13.4 Refresh the Short-Lived Token

The lab uses a short-lived ServiceAccount token rather than a permanently valid token.

When the token expires, an administrator can generate a new token and update the agent's kubeconfig.

```bash
kubectl create token jenkins-deployer -n devops-lab --duration=1h > /tmp/jenkins-k8s-token
chmod 600 /tmp/jenkins-k8s-token

sudo install -o jenkins-agent -g jenkins-agent -m 600 \
  /tmp/jenkins-k8s-token \
  /home/jenkins-agent/.kube/token

sudo -u jenkins-agent kubectl config \
  --kubeconfig=/home/jenkins-agent/.kube/config \
  set-credentials jenkins-deployer \
  --token="$(sudo cat /home/jenkins-agent/.kube/token)"

rm -f /tmp/jenkins-k8s-token
```

Verify the agent's access:

```bash
sudo -u jenkins-agent kubectl get pods -n devops-lab
```

Do not display, copy into build logs, or commit the token.

The token is valid only for its configured lifetime. Renew it before running a pipeline after expiration.

## 14. Troubleshooting and Verification Log

This section records issues encountered during the actual lab build, along with their diagnosis, resolution, and verification.

### 14.1 Minikube Memory Allocation

**Symptom:** Starting Minikube with 4096 MB of memory failed.

**Diagnosis:** The WSL environment reported a lower available memory limit than the requested allocation.

**Resolution:** Started Minikube with 3072 MB of memory and two CPUs.

**Verification:**

```bash
minikube status
kubectl get nodes
kubectl get pods -n kube-system
```

The control plane reached Running, the node reached Ready, and the system pods reached Running.

### 14.2 Local Docker Image Unavailable to Kubernetes

**Symptom:** The application image existed in the local Docker environment, but Minikube needed the image inside its own container environment.

**Resolution:**

```bash
minikube image load docker-containerization-lab-web:latest
```

The Deployment uses `IfNotPresent` so Kubernetes can use the loaded local image.

**Verification:**

```bash
kubectl get pods -n devops-lab
kubectl rollout status deployment/flask-app -n devops-lab
```

The application pods started successfully.

### 14.3 Local Port 8080 Was Already Occupied

**Symptom:** Port-forwarding the Kubernetes Service to local port 8080 failed. A request to that port returned Jenkins authentication content rather than the Flask application.

**Diagnosis:** Jenkins was already listening on port 8080.

**Resolution:** Changed the local port-forward target to 8081:

```bash
kubectl port-forward -n devops-lab service/flask-app-service 8081:80
```

**Verification:**

```bash
curl http://localhost:8081/
curl http://localhost:8081/health
curl http://localhost:8081/visit
```

The application returned its JSON response, the health endpoint returned a healthy status, and the visit counter returned a count.

### 14.4 Persistent Visit-Counter Volume Permissions

**Symptom:** The application initially encountered a permission issue when writing visit data to its mounted volume.

**Diagnosis:** The mounted data directory was not writable by the application's non-root user.

**Resolution:** Created the application data directory and assigned ownership to `appuser` in the Docker image.

**Verification:** Rebuilt and ran the application, then requested the visit endpoint multiple times and across a container restart. The visit counter persisted successfully.

### 14.5 Deployment Scaling, Rollout, and Rollback

**Verification performed:**

- Scaled the Deployment from two to three replicas.
- Confirmed all three pods became Ready.
- Changed `APP_ENV` to trigger a rolling update.
- Confirmed the rollout completed.
- Ran a rollout undo.
- Confirmed the rollback completed and the Deployment returned to three Ready replicas.

Useful commands:

```bash
kubectl get deployment flask-app -n devops-lab
kubectl get pods -n devops-lab
kubectl rollout history deployment/flask-app -n devops-lab
kubectl rollout status deployment/flask-app -n devops-lab
```

### 14.6 Metrics Server and HPA Metrics

**Symptom:** Resource metrics were not initially available for `kubectl top` and HPA utilization reporting.

**Resolution:** Enabled the Minikube Metrics Server addon:

```bash
minikube addons enable metrics-server
```

**Verification:**

```bash
kubectl top nodes
kubectl top pods -n devops-lab
kubectl get hpa -n devops-lab
```

Node and pod metrics became available. The HPA reported CPU utilization against its configured 70% target and maintained the configured minimum of two replicas during the observed checks.

### 14.7 Jenkins Agent Kubernetes Connectivity

**Symptom:** The Jenkins agent initially could not access the Minikube cluster because it did not have its own Kubernetes client configuration.

**Diagnosis:** The agent needed a kubeconfig containing the cluster API endpoint, CA certificate, and authenticated identity.

**Resolution:**

- Created a protected kubeconfig under `/home/jenkins-agent/.kube/`.
- Configured the Minikube API endpoint.
- Configured the cluster CA certificate.
- Used the dedicated `jenkins-deployer` ServiceAccount.
- Stored the short-lived token outside the Git repository.
- Restricted access to the kubeconfig and token files.

**Verification:**

```bash
sudo -u jenkins-agent kubectl get pods -n devops-lab
sudo -u jenkins-agent kubectl get deployments,services -n devops-lab
```

The Jenkins agent successfully accessed the namespace-scoped application resources.

### 14.8 Jenkins RBAC Least-Privilege Validation

**Symptom:** The initial Role included broader permissions than the pipeline required.

**Resolution:** Tightened the Role to remove unnecessary delete permissions and ReplicaSet access.

**Verification:**

```bash
sudo -u jenkins-agent kubectl auth can-i delete deployments -n devops-lab
sudo -u jenkins-agent kubectl auth can-i patch deployments -n devops-lab
sudo -u jenkins-agent kubectl auth can-i get replicasets -n devops-lab
```

Observed results:

```text
no
yes
no
```

Additional checks confirmed that the Jenkins identity could read required namespace resources but could not read Secrets or list cluster-wide nodes.

The pipeline also explicitly checks that each required permission returns `yes`. This is important because `kubectl auth can-i` may print `no` without returning a failing process exit code.

### 14.9 Short-Lived ServiceAccount Token Renewal

**Operational consideration:** The Jenkins ServiceAccount token is short-lived and expires after one hour.

**Resolution:** Generated a replacement token and updated the credentials in the Jenkins agent's protected kubeconfig.

**Verification:**

```bash
sudo -u jenkins-agent kubectl get pods -n devops-lab
```

The Jenkins agent successfully listed the running application pods after renewal.

Do not replace this approach with a permanently valid token stored in the repository. Any token renewal procedure must keep the token out of terminal output, build logs, and source control.

## 15. Cleanup

Delete the application resources:

```bash
kubectl delete -f k8s/hpa.yaml
kubectl delete -f k8s/service.yaml
kubectl delete -f k8s/deployment.yaml
kubectl delete -f k8s/secret.yaml
kubectl delete -f k8s/configmap.yaml
```

Delete the namespace and its remaining resources:

```bash
kubectl delete namespace devops-lab
```

Stop Minikube:

```bash
minikube stop
```

To delete the local Minikube cluster entirely:

```bash
minikube delete
```

**Warning:** Deleting the cluster removes its Kubernetes workloads and cluster-local resources. Do this only when you no longer need the lab environment.

## 16. Final Validation Checklist

Use this checklist when validating the lab:

- [ ] Minikube cluster starts successfully.
- [ ] Kubernetes node reaches Ready.
- [ ] Application image is loaded into Minikube.
- [ ] Namespace and ConfigMap are applied.
- [ ] Demo Secret is applied separately.
- [ ] Deployment reaches the desired number of Ready replicas.
- [ ] Service exposes the application.
- [ ] Application root endpoint responds.
- [ ] Health endpoint returns a healthy status.
- [ ] Visit counter endpoint responds.
- [ ] ConfigMap environment variable is available inside the pod.
- [ ] Demo Secret is injected without exposing its value.
- [ ] Deployment scaling works.
- [ ] Rolling update completes.
- [ ] Rollback completes.
- [ ] Metrics Server returns node and pod metrics.
- [ ] HPA reports CPU utilization.
- [ ] Jenkins agent authenticates to Kubernetes.
- [ ] Jenkins RBAC allows only the required namespace-scoped operations.
- [ ] Jenkins pipeline validates manifests, deploys resources, and tests application health.
- [ ] Jenkins reports are archived successfully.
- [ ] Tokens and kubeconfig files remain outside source control.

## 17. Learning Outcomes

This lab provides practical experience with:

- Kubernetes cluster setup and administration.
- Deployments, ReplicaSets, Pods, and Services.
- ConfigMaps and Secrets.
- Readiness and liveness probes.
- Resource requests and limits.
- Scaling and rolling updates.
- Rollback and rollout history.
- Metrics Server and Horizontal Pod Autoscaling.
- Namespace-scoped RBAC and least-privilege access.
- Jenkins-to-Kubernetes integration.
- Short-lived ServiceAccount token management.
- Troubleshooting application connectivity and cluster operations.
