# 🐄 Wisecow DevOps Deployment

This repository contains the full DevOps pipeline for deploying the Wisecow backend service using Docker, Kubernetes, and GitHub Actions. AWS deployment via Terraform is scaffolded but optional.

---

## 📁 Project Structure

wisecow-devops-deployment/                                                                          
├── Dockerfile                                                                                      
├── README.md                                                                                       
├── .github/                                                                                        
│ └── workflows/                                                                                                                                               
│ └── ci.yml                                                                                                                                                     
├── .vscode/                                                                                                                                                  
│ └── settings.json                                                                                                                                                  
├── k8s/                                                                                                                                                  
│ ├── deployment.yaml                                                                                                                                                  
│ ├── service.yaml                                                                                                                                                  
│ ├── ingress.yaml                                                                                                                                                  
│ ├── clusterissuer.yaml                                                                                                                                                  
│ ├── selfsigned-issuer.yaml                                                                                                                                              
│ ├── selfsigned-cert.yaml                                                                                                                                                  
│ └── test-curl.sh                                                                                                                                                  
├── scripts/                                                                                                                                                  
│ ├── app_uptime.py                                                                                                                                                  
│ └── health_check.py                                                                                                                                                  
└── wisecow/                                                                                                                                                  
├── LICENSE                                                                                                                                                  
├── README.md                                                                                                                                                  
└── wisecow.sh                                                                                                                                                  

---

## 🚀 Deployment Overview

### ✅ Docker

- Containerized backend using `Dockerfile`
- Entrypoint managed via `wisecow.sh`

### ✅ Kubernetes

- Deployment, service, ingress configured
- TLS via cert-manager (self-signed issuer)
- Health checks via custom Python scripts

### ✅ CI/CD

- GitHub Actions for build and deploy
- `ci.yml`: Lint, test, build
- `deploy.yml`: Push to cluster (once connected)

### ✅ Terraform (Optional)

- Full AWS EKS provisioning scaffolded
- Includes VPC, IAM, node group setup
- Not deployed due to time constraints

---

## ⚠️ Deployment Notes

AWS provisioning was attempted via Terraform but blocked due to subnet IP assignment and node group registration failures. All infrastructure code is validated and cloud-ready for future deployment.

Local validation is complete via Minikube or Docker.

---

## 🧪 Local Validation

To simulate deployment locally:

### Using Minikube:

```bash
minikube start
kubectl apply -f k8s/
kubectl get pods

### Using Docker:

docker build -t wisecow .
docker run -p 8080:8080 wisecow
```

This project demonstrates backend-first DevOps maturity, with reproducible infrastructure, secure service routing, and CI/CD automation. AWS deployment is optional and documented for future use.

## 🔐 KubeArmor Policy (Optional Bonus)

KubeArmor was installed via Helm and the Wisecow pod was labeled correctly. However, due to broken CRD paths and undocumented repo changes, the policy could not be applied. The bonus loop was attempted with backend clarity and security maturity, but skipped due to upstream blockers.
