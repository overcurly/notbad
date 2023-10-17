## Highlights

### - Develop the app locally
- Python Flask
- Dockerize
- Docker-Compose

### - Provision ( Terraform )
- Network 
- EC2
- ALB ( Optional )
- Security Groups
- ECR
- Dynamically Create Inventory File

### - Configuration/Setup ( Ansible )
- Setup micro8s

### - CI/CD Pipeline ( GitHub Actions )
- Build and push image
  - Create user with ECR push permission
  - Write the actual script and test
- Create K8s Resource Definitions
  - Deployment
  - Service
  - Ingress
### -  Deploy to K8s
  - Create image pull secret
```
    kubectl create secret docker-registry regcred \
    --docker-server=820469828681.dkr.ecr.eu-north-1.amazonaws.com \
    --docker-username=AWS \
    --docker-password=$(aws ecr get-login-password) \
    --namespace=default
```
  - Perform deployment locally via kubectl 
  - Perform deployment with Git

### - Enable and Configure ArgoCD
  - kubectl port-forward service/argo-cd-argocd-server -n argocd 8080:443
  - After reaching the UI the first time you can login with username: admin and the random password generated during the installation. You can find the password by running:

`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`

- ### Test
  - `curl -X POST -H "NotBad:true" http://51.20.186.17`