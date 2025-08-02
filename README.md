# AWS Multi-Tier Infrastructure Using Terraform
 
This project demonstrates how to provision a **production-grade, modular AWS infrastructure** using **Terraform**. It includes VPC setup, public/private subnets, Auto Scaling EC2 instances behind an Application Load Balancer (ALB), and a MySQL RDS database — all securely separated with IAM roles and security groups.
 
---
 
## 🚀 Tools & Technologies
 
- **Terraform** – Infrastructure as Code (IaC)
- **AWS** – Cloud provider
- **VPC** – Isolated network
- **EC2 + ALB + ASG** – Scalable compute tier
- **RDS (MySQL)** – Backend database
- **S3 + DynamoDB** – Remote backend for Terraform state
 
---
 
## 🧱 Architecture Components
```
                   Internet
                      │
               ┌──────▼──────┐
               │ ALB (Public)│
               └──────┬──────┘
                      │
     ┌────────────────┼────────────────┐
     │                │                │
EC2 (ASG)       EC2 (ASG)       EC2 (ASG)    ← In Private Subnets
     │                │                │
     └────────┬───────┴────────┬───────┘
              ▼                ▼
         RDS (MySQL)     NAT Gateway
```
 
---
 
## 📁 Module Structure
```
├── main.tf # Root Terraform config
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── modules/
├── vpc/
├── ec2/
├── alb/
└── rds/
```
 
Each module is reusable and parameterized with input variables and outputs.
 
---
 
## ✅ Key Features
 
- **Modular Terraform**: Clean, reusable code for each infra component
- **Public-Private Subnet Separation**
- **EC2 ASG + ALB** for scalable app deployment
- **RDS (MySQL)** in private subnet, secure access from EC2 only
- **S3 + DynamoDB** as Terraform remote state backend with locking
- **Lifecycle Rules** and Workspaces for dev/prod environments
 
---
 
## ⚙️ Sample Terraform Commands
 
```bash
# Initialize the project
terraform init
 
# Preview the resources to be created
terraform plan
 
# Apply the infrastructure
terraform apply
 
# Destroy infrastructure
terraform destroy
