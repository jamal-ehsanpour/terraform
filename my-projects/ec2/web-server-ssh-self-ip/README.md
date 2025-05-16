# 🚀 AWS EC2 Web Server Deployment with Terraform

<div align="center">
  <img src="https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform">
  <img src="https://img.shields.io/badge/Amazon%20AWS-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS">  
  <img src="https://img.shields.io/badge/EC2-FF9900?style=for-the-badge&logo=amazonec2&logoColor=white" alt="EC2">
  <img src="https://img.shields.io/badge/Apache-D22128?style=for-the-badge&logo=apache&logoColor=white" alt="Apache">
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">
</div>

## 🌟 Overview

This repository automates the deployment of a secure web server on AWS using Terraform:


## 📁 Project Structure

```
.
├── ec2.tf            # EC2 instance configuration
├── install-httpd.sh  # Bootstrap script for web server
├── outputs.tf        # Output definitions
├── sg.tf             # Security group configuration
└── variables.tf      # Variable definitions
```


### 🛠️ Key Components

| Component | Description | Icon |
|-----------|-------------|------|
| **AWS EC2** | Compute instance running web server | <img src="https://img.shields.io/badge/-EC2-FF9900?style=flat-square&logo=amazonec2&logoColor=white" width="80"> |
| **Security Groups** | Firewall rules for HTTP/SSH access | <img src="https://img.shields.io/badge/-Security%20Group-FF9900?style=flat-square&logo=amazonaws&logoColor=white" width="120"> |
| **Apache HTTPD** | Web server software | <img src="https://img.shields.io/badge/-Apache-D22128?style=flat-square&logo=apache&logoColor=white" width="80"> |
| **Terraform** | Infrastructure as Code | <img src="https://img.shields.io/badge/-Terraform-7B42BC?style=flat-square&logo=terraform&logoColor=white" width="80"> |

### ✨ Features

- 🔒 **Secure by Default**: SSH access restricted to your current IP
- 🌐 **Web Ready**: Apache installed automatically via user data
- 🏷️ **Proper Tagging**: All resources tagged for better organization
- 📦 **Infrastructure as Code**: Fully reproducible deployments
- ⚡ **Quick Deployment**: Get a web server running in minutes

> **Note**: For production use, consider adding HTTPS, monitoring, and backup solutions.


## 🚀 Deployment

1. Clone this repository:
```
git clone https://github.com/jamal-ehsanpour
cd /terraform/my-projects/ec2
```

2. Initialize Terraform:
```
terraform init
```
3. Review the execution plan:
```
terraform plan
```
4. Apply the configuration:
```
terraform apply
```
5. After applying, Terraform will output the public IP address of your web server.
You can access it in your browser at http://<"public-ip">.

🧹 Cleanup
6. To destroy all created resources when done:
```
terraform destroy
```

Customization
You can customize the deployment by modifying the variables in variables.tf or by passing variables at runtime:
```
terraform apply -var="instance_type=t3.small" -var="http-port=8080"
```


## Resources

<div align="center">
  <img src="https://img.shields.io/badge/Amazon%20EC2-FF9900?style=for-the-badge&logo=amazonec2&logoColor=white" height="30" alt="EC2">
  <img src="https://img.shields.io/badge/AWS%20Security%20Group-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white" height="30" alt="Security Group">
  <img src="https://img.shields.io/badge/AWS%20VPC-FF9900?style=for-the-badge&logo=amazonaws&logoColor=white" height="30" alt="VPC">
  <img src="https://img.shields.io/badge/Apache%20HTTP-D22128?style=for-the-badge&logo=apache&logoColor=white" height="30" alt="Apache">
  <img src="https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" height="30" alt="Terraform">
</div>
