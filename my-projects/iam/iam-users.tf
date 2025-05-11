# Create IAM user with console access
resource "aws_iam_user" "users" {
  for_each = toset(var.names)
  name     = "dev-user-${each.value}"

  tags = var.tags
}

# Generate login profiles with PGP encryption
resource "aws_iam_user_login_profile" "logins" {
  for_each                = aws_iam_user.users
  user                    = each.value.name
  pgp_key                 = "keybase:${var.pgp_user}"
  password_reset_required = var.password_reset_required
  password_length = var.password_length
}

data "aws_caller_identity" "current" {}

