# 🌐 Terraform Web Server with ALB, ASG & HTTPS Redirect

This project uses **Terraform** to deploy a **highly available web server** infrastructure on **AWS**, featuring:

- **Application Load Balancer (ALB)** with HTTPS support
- **Auto Scaling Group (ASG)** for elasticity
- **Launch Template for EC2**
- **HTTP → HTTPS redirect** for secure connections
- All infrastructure defined using **Infrastructure as Code (IaC)** best practices

---

## 📁 Project Structure

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


✅ What This Project Does

- Creates a VPC, subnets, internet gateway, and routing

- Provisions a Launch Template for EC2 instances with user data

- Deploys an Auto Scaling Group across multiple AZs

- Configures an ALB with:

  - Listener on port 80 to redirect to HTTPS (port 443)

  - Listener on port 443 with an ACM SSL certificate

- Automatically registers EC2 instances with the target group

- Uses security groups and best practices to control access



🚀 Prerequisites
Terraform >= 1.3

- AWS CLI configured

- AWS credentials with appropriate IAM permissions

- An ACM SSL certificate in the region (e.g., us-east-1)



⚙️ How to Use
1. Clone the Repository
```bash
git clone https://github.com/jamal-ehsanpour/terraform.git
cd terraform/my-projects/alb
```

2. Initialize Terraform
```bash
terraform init
```
3. Customize Variables
Edit the terraform.tfvars file or pass variables via CLI:
```bash
region        = "us-east-1"
key_name      = "your-ec2-keypair-name"
certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/abc123"
```

4. Apply the Configuration
```bash
terraform apply -auto-approve
```


🌐 Access the Web Server
Once provisioning is complete, Terraform will output:

✅ ALB DNS name (e.g., my-app-alb-123456.elb.amazonaws.com)

You can visit it in your browser using https:// — traffic on HTTP is automatically redirected.




🔒 Best Practices Followed
HTTPS redirection and encryption using ACM + ALB

- Least privilege security group rules

- Stateless and scalable infrastructure via Auto Scaling Group

- Infrastructure codified and modularized for reuse

- User data scripts for automated EC2 provisioning


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

If you found this project helpful, feel free to ⭐ the repo!






