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
| `names` | List of IAM users with their configuration. | `list` | `[]` | Yes |
| `groups` | Name of the group | `string` | `` | No |
| `password_length` | Length of auto-generated console passwords (8-128 chars) | `number` | `16` | No |
| `password_reset_required` | Whether the user should be forced to reset the generated password on first login. | `bool` | `true` | No |
| `tags` |A map of tags to be added to resources. | `map(string)` | `{}` | No |
| `pgp_user` | Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key. | `string` | `` | Yes |


## Outputs 📤


| Output Name | Description | Type | Sensitive | Example |
|------------|-------------|------|-----------|---------|
| `user_arns` | IAM User ARNs | `map(string)` | No | ![ARN](https://img.shields.io/badge/Format-ARN-blue) |
| `group_arns` | IAM Group ARNs | `map(string)` | No | ![ARN](https://img.shields.io/badge/Format-ARN-blue) |
| `secret_arns` | Secrets Manager locations | `map(string)` | Yes 🔐 | ![Secret](https://img.shields.io/badge/Storage-Secure-green) |
| `encrypted_passwords` | PGP-encrypted secrets | `map(string)` | Yes 🔐 | ![PGP](https://img.shields.io/badge/Encrypted-PGP-red) |


### Usage Examples

**1. Get all user ARNs:**
```hcl
output "all_user_arns" {
  value = module.iam.user_arns
}
