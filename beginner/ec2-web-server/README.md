# 🚀 Terraform AWS Web Server Project

![AWS Terraform](https://img.shields.io/badge/AWS-Terraform-orange?logo=amazon-aws&logoColor=white)

Deploys a complete web server infrastructure on AWS including VPC, networking components, and an Apache HTTP server.

## 📋 Project Overview

This Terraform configuration creates:
- A VPC with public subnet
- Internet Gateway and route tables
- Security group allowing HTTP/HTTPS/SSH
- EC2 instance with Apache web server
- Elastic IP address for the instance

## 🛠️ Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
- [AWS CLI](https://aws.amazon.com/cli/) configured with credentials
- AWS key pair named "main-key" (or modify `key_name` in `main.tf`)

## 🚀 Deployment

### Step 1: Clone the repository (if not already cloned):
   ```bash
   git clone https://github.com/jamal-ehsanpour/terraform.git
   cd terraform/beginner/ec2-web-server
   ```
### Step 2: Initialize Terraform
 ```bash
terraform init
 ```

### Step 3: Review Execution Plan
```bash
terraform plan
```

### Step 4: Apply Configuration
```bash
terraform apply
```

## 📂 Files

| File | Description | Link |
|------|-------------|------|
| `main.tf` | Main Terraform configuration | [View Code](main.tf) |
| `install-httpd.sh` | Bootstrap script for Apache | [View Code](install-httpd.sh) |


## 📚 Resource Links

🔹 [AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)  
🔹 [Terraform Docs](https://developer.hashicorp.com/terraform/docs)  
🔹 [EC2 User Guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/)
