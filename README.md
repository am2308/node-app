# 🚀 Node.js Application Deployment on AWS ECS using Terraform & GitHub Actions  

## **📌 About This Repository**  
This repository automates the **provisioning of AWS infrastructure** and **deployment of a Node.js application** to **Amazon ECS (Fargate)** using **Terraform** and **GitHub Actions CI/CD pipelines**.  

### **🔹 What This Repo Contains?**  
- **Node.js Application**: Located in the root directory with a `Dockerfile` for containerization.  
- **GitHub Actions Workflows**: Automates infrastructure provisioning, application deployment, and resource teardown.  
- **Terraform Modules**: Located in the `terraform/` directory, which includes:  
  - **VPC Module** → Creates VPC, subnets, and networking resources.  
  - **ECS Module** → Creates ECS Cluster, ECS Service, and Task Definitions.  
  - **ECR Module** → Creates an ECR repository to store Docker images.  
  - **ALB Module** → Sets up an Application Load Balancer (ALB).  
  - **Route 53 Module** → Creates domain alias records.  
  - **KMS Module** → Manages encryption keys for security.  

---

## **📌 Prerequisites**  
Before deploying, ensure you have:  
✅ An **AWS Account** with IAM permissions to create resources.  
✅ **GitHub Repository Secrets** configured for deployment.  
✅ **Terraform Installed** → [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)  
✅ **Docker Installed** → [Install Docker](https://docs.docker.com/get-docker/)  

### **🔹 Required GitHub Secrets**
This repository requires the following **GitHub Secrets** for deployment:

| **Secret Name**   | **Description** |
|------------------|---------------|
| `AWS_ROLE_ARN`   | IAM Role ARN for GitHub OIDC authentication |
| `AWS_REGION`     | AWS region (e.g., `us-east-1`) |
| `ECR_REGISTRY`   | Amazon ECR Registry URL |
| `ECR_REPOSITORY` | Amazon ECR Repository Name |
| `TF_STATE_BUCKET` | S3 bucket for Terraform backend storage |
| `TF_STATE_DYNAMODB_TABLE` | DynamoDB table for Terraform state locking |

### **🔹 How to Add GitHub Secrets**
1. Go to **GitHub Repository → Settings → Secrets and Variables → Actions**  
2. Click **New repository secret**  
3. Add each required secret with the correct values  

---

## **📌 How to Deploy the Infrastructure and Application**  

The deployment process is **fully automated** using **GitHub Actions**.  

### **1️⃣ Fork and Clone the Repository**  
```sh
git clone https://github.com/YOUR_GITHUB_USERNAME/node-app.git
cd node-app
