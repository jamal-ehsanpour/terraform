# 🚀 Terraform Projects by Jamal Ehsanpour

![Terraform Logo](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)

A collection of Terraform projects showcasing infrastructure-as-code (IaC) skills for core AWS  services, organized by service type.

## 📌 Overview

All projects are designed with **best practices** and align with HashiCorp's certification exam objectives.

## 🏗️ Project Structure

```bash
terraform/
├── my-projects/
│ ├── iam/ # Identity & Access Management
│ ├── ec2/ # Elastic Compute Cloud
│ ├── elb/ # Elastic Load Balancing
│ ├── asg/ # Auto Scaling Groups
│ ├── sg/ # Security Groups
│ ├── s3/ # Simple Storage Service
├── modules/ # Reusable Terraform modules
├── examples/ # Usage examples
└── README.md # This file
```


🛠️ Getting Started

### Prerequisites
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
- AWS account 
- [AWS CLI](https://aws.amazon.com/cli/) configured (for AWS projects)
  

Basic Usage
1. Clone the repository:
```bash
git clone https://github.com/jamal-ehsanpour/terraform.git
```
2. Navigate to any project:
```bash
   cd terraform/my-projects/<service>
```
3. Initialize and apply:
```bash
terraform init
terraform apply
```

## Service-Specific Documentation

| Service | Description                          | Documentation | Status |
|---------|--------------------------------------|---------------|--------|
| ![IAM](https://img.shields.io/badge/-IAM-orange) | Identity and Access Management | [📚 Docs](./my-projects/iam/README.md) | ![Ready](https://img.shields.io/badge/status-ready-green) |
| ![EC2](https://img.shields.io/badge/-EC2-yellow) | Virtual Servers | [📚 Docs](./my-projects/ec2/README.md) | ![Ready](https://img.shields.io/badge/status-ready-green) |
| ![ELB](https://img.shields.io/badge/-ELB-blue) | Load Balancers | [📚 Docs](./my-projects/elb/README.md) | ![WIP](https://img.shields.io/badge/status-wip-yellow) |
| ![ASG](https://img.shields.io/badge/-ASG-red) | Auto Scaling | [📚 Docs](./my-projects/asg/README.md) | ![Planned](https://img.shields.io/badge/status-planned-lightgrey) |
| ![S3](https://img.shields.io/badge/-S3-black) | Object Storage | [📚 Docs](./my-projects/s3/README.md) | ![Ready](https://img.shields.io/badge/status-ready-green) |

## 📚 Learning Resources
- 🔍 [Official Terraform Documentation](https://developer.hashicorp.com/terraform/docs) - Core concepts and CLI reference
- 🎯 [Terraform Associate Exam Guide](https://developer.hashicorp.com/terraform/tutorials/certification/associate-review) - Certification study guide
- ☁️ [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) - Complete AWS resource reference






🤝 Contributing
Pull requests are welcomed! For major changes, please open an issue first.


<p align="center"> <b>Happy Terraforming! 🚀</b> </p> 
