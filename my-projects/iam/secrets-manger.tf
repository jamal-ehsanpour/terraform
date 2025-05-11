# Store each user's password in Secrets Manager
resource "aws_secretsmanager_secret" "user-secrets" {
  for_each    = aws_iam_user.users
  name        = "iam-console-${each.value.name}"
  description = "Console credentials for ${each.value.name}"

  tags = {
    Rotation = "Monthly"
  }

}

resource "aws_secretsmanager_secret_version" "creds" {
  for_each  = aws_iam_user_login_profile.logins
  secret_id = aws_secretsmanager_secret.user-secrets[each.key].id
  secret_string = jsonencode({
    username           = each.key
    encrypted_password = each.value.encrypted_password
    console_url        = "https://${data.aws_caller_identity.current.account_id}.signin.aws.amazon.com/console"
  })


}


resource "aws_secretsmanager_secret_rotation" "example" {
    for_each  = aws_secretsmanager_secret.user-secrets
    secret_id  = aws_secretsmanager_secret.user-secrets[each.key].id

  rotation_rules {
    automatically_after_days = 30
  }
}