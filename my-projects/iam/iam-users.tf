# Create IAM user with console access
resource "aws_iam_user" "users" {
  for_each = toset(var.names)
  name     = "dev-user-${each.value}"

  tags = {
    Department = "dev"
    ManagedBy  = "Terraform"
  }
}

# Generate login profiles with PGP encryption
resource "aws_iam_user_login_profile" "logins" {
  for_each                = aws_iam_user.users
  user                    = each.value.name
  pgp_key                 = "keybase:${var.pgp_user}"
  password_reset_required = true
}

data "aws_caller_identity" "current" {}

# Output only secret ARNs
output "secret_arns" {
  value = {
    for username, secret in aws_secretsmanager_secret.user-secrets :
    username => secret.arn
  }
  description = "Retrieve passwords from these Secrets Manager ARNs"
}