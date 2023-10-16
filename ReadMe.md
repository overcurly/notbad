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
  - Write teh actual script and test
- Create K8s Resource Definitions
  - Deployment
  - Service
  - Ingress
- Deploy to K8s
  - Create service account
  - Perform deployment with Github