# AWS IAM Terraform Module

![Terraform Version](https://img.shields.io/badge/terraform-%3E%3D1.3.0-blue)
![AWS Provider](https://img.shields.io/badge/AWS%20Provider-%3E%3D5.0-orange)

This Terraform module manages AWS Identity and Access Management (IAM) resources with security best practices.

## Features

- 🔐 **Secure User Management**
  - Console access with auto-generated passwords
  - Programmatic access with rotating credentials
  - MFA enforcement options
- 🛡️ **Policy Management**
  - Custom policy creation
  - Managed policy attachments
  - Permission boundaries
- 🔄 **Automated Secret Rotation**
  - AWS Secrets Manager integration
  - 30-day automatic rotation
- 🏷️ **Tagging Compliance**
  - Enforce mandatory tagging
  - Cost allocation ready

## File Structure
```bash
📁 iam/
├── 📄 iam-groups.tf           # IAM groups
├── 📄 iam-policy.tf           # IAM policiy
├── 📄 iam-users.tf            # IAM users
├── 📄 secrets-manager.tf      # Secrets Manager
├── 📄 variables.tf            # Input variables
├── 📄 outputs.tf              # Module outputs
├── 📄 README.md               # Documentation
└── 📂 examples/               # Usage examples
    ├── 📂 basic_iam/          # 🏗️ Basic setup
    ├── 📂 with_mfa/           # 🔑 MFA-enabled
```

Input Variables
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `users` | Map of IAM users with their configuration.<br>Example:<br>```{ "user1" = { groups = ["developers"], policy_arns = [...] } }``` | `map(object)` | `{}` | Yes |
| `groups` | Map of IAM groups with their policies.<br>Example:<br>```{ "developers" = { policy_arns = [...] } }``` | `map(object)` | `{}` | No |
| `password_length` | Length of auto-generated console passwords (8-128 chars) | `number` | `16` | No |
| `require_mfa` | Whether to enforce MFA for console access | `bool` | `true` | No |
