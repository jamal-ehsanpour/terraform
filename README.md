# 🚀 Terraform Projects by Jamal Ehsanpour

![Terraform Logo](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)

A collection of Terraform projects showcasing infrastructure-as-code (IaC) skills and preparation for the **HashiCorp Certified: Terraform Associate** exam.

## 📌 Overview

This repository contains hands-on Terraform configurations for:
- **Basic deployments** (EC2, S3, VPCs)
- **Intermediate architectures** (Load balancers, Auto Scaling Groups)
- **Advanced scenarios** (Multi-cloud, CI/CD pipelines)

All projects are designed with **best practices** and align with HashiCorp's certification exam objectives.

## 🏗️ Project Structure

```bash
├───beginner/
│   ├───ec2-web-server/      # VPC + EC2 instance with Apache
│   ├───s3-static-website/   # Host static files on AWS S3
│   └───docker-nginx/        # Container deployment with Terraform
├───intermediate/
│   ├───asg-alb/             # Auto Scaling Group + Application LB
│   └───remote-state/        # S3 backend configuration
├───advanced/
│   ├───multi-cloud/         # AWS + Azure deployment
│   └───ci-cd-pipeline/      # GitHub Actions for Terraform
├───README.md                # This file
└───LICENSE                  # MIT License
```


🛠️ Getting Started

### Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
- AWS/Azure/GCP account (free tier recommended)
- [AWS CLI](https://aws.amazon.com/cli/) configured (for AWS projects)
  

Basic Usage
1. Clone the repository:
```bash
git clone https://github.com/jamal-ehsanpour/terraform.git
```
2. Navigate to any project:
```bash
   cd beginner/ec2-web-server
```
3. Initialize and apply:
```bash
terraform init
terraform apply
```

## 📚 Learning Resources
- 🔍 [Official Terraform Documentation](https://developer.hashicorp.com/terraform/docs) - Core concepts and CLI reference
- 🎯 [Terraform Associate Exam Guide](https://developer.hashicorp.com/terraform/tutorials/certification/associate-review) - Certification study guide
- ☁️ [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) - Complete AWS resource reference






🤝 Contributing
Pull requests are welcomed! For major changes, please open an issue first.


<p align="center"> <b>Happy Terraforming! 🚀</b> </p> 
