# 🚀 Terraform Project: Web Server with ALB, ASG & HTTPS Redirect 🌐🔐
![Terraform Version](https://img.shields.io/badge/terraform-%3E%3D1.3.0-blue)
![AWS Provider](https://img.shields.io/badge/AWS%20Provider-%3E%3D5.0-orange)

This project uses **Terraform** to provision a **secure and scalable web server infrastructure on AWS**, including:

✨ Application Load Balancer (ALB)  
📈 Auto Scaling Group (ASG)  
💻 EC2 Instances with Launch Template  
🔒 HTTPS with automatic HTTP → HTTPS redirect  
🧾 Fully codified using Infrastructure as Code (IaC) best practices  

---

## 🧰 Project Structure

```bash
alb/
├── alb.tf                 # Appliation load balancer
├── asg.tf                  # Auto scaling group
├── data.tf                 # Data resource needed to get the latest linux ami
├── launch-template.tf      # The launch template to create ec2 instance in the ASG
├── sg.tf                   # All the required security groups for ec2 instance and alb
├── variables.tf            # Input variables
├── outputs.tf              # Exported outputs
├── providers.tf            # Provider & version locking
├── user-data.sh             # Startup script for EC2 instances
├── README.md               # Project documentation
```

---

## ✅ Features

- 🔁 Launches **EC2 instances via Launch Template**
- 📊 Deploys **Auto Scaling Group** across multiple AZs
- 🌐 Provisions **ALB** with:
  - Port 80: HTTP → HTTPS redirect 🔁
  - Port 443: Secure HTTPS using ACM certificate 🔐
- 🔐 Uses **Security Groups** to control access
- 🧠 Applies **Terraform best practices** for structure and scalability

---

## 🔧 Prerequisites

| Tool           | Requirement         |
|----------------|----------------------|
| 🧱 Terraform    | `>= 1.3`             |
| ☁️ AWS CLI      | Configured with credentials |
| 🧾 IAM Role     | Sufficient permissions to create resources |
| 📜 ACM Cert     | Valid SSL certificate in the selected AWS region |

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/jamal-ehsanpour/terraform.git
cd terraform/my-projects/alb
```

2️⃣ Initialize Terraform
```bash
terraform init
```


3️⃣ Customize Variables
Edit the terraform.tfvars file or pass variables via CLI:
```bash
region        = "us-east-1"
key_name      = "your-ec2-keypair-name"
certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/abc123"
```


4️⃣ Apply the Configuration
```bash
terraform apply -auto-approve
```

🌐 Output
After deployment, Terraform will show:

🔗 ALB DNS name → Visit your app securely using HTTPS

🚫 HTTP traffic is automatically redirected


📦 Best Practices Implemented
| ✅ Practice                | Description                                     |
| ------------------------- | ----------------------------------------------- |
| 🔐 HTTPS Security         | Enforced encryption via ACM + ALB               |
| 🎯 Least Privilege        | Scoped Security Group rules                     |
| 📈 Scalable Infra         | Auto Scaling based on load                      |
| ⚙️ Automated Provisioning | Bootstrapped EC2 with `userdata.sh`             |
| 💾 Modular & Reusable     | Cleanly separated files for readability & reuse |






🌐 Access the Web Server
Once provisioning is complete, Terraform will output:

✅ ALB DNS name (e.g., my-app-alb-123456.elb.amazonaws.com)

You can visit it in your browser using https:// — traffic on HTTP is automatically redirected.



🧹 Cleanup
To destroy all resources:
```bash
terraform destroy
```


📌 Notes
- Make sure your ACM certificate is in the same region as the ALB.

- The project currently creates new networking components; update it to use existing VPC/subnets if needed.


📬 Contact

Made with ❤️ by Jamal Ehsanpour
## 👤 Author

Developed by [**Jamal Ehsanpour**](https://linkedin.com/in/jamal-ehsanpour-239563194)  
📂 [GitHub Portfolio](https://github.com/jamal-ehsanpour)  
🌍 [AWS Project Portfolio](http://my-portfolio-cicd.s3-website-eu-west-1.amazonaws.com/)


If you found this project helpful:

⭐ Star it on GitHub

🍴 Fork it and make it your own

📢 Share it with fellow DevOps & Cloud Engineers!








