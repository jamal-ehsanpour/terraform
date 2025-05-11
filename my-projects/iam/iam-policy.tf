resource "aws_iam_policy" "secret_access" {
  name        = "IAMUserSecretsAccess"
  description = "Allows access to IAM user console credentials"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = "secretsmanager:GetSecretValue",
      Resource = [for secret in aws_secretsmanager_secret.user-secrets : secret.arn]
    }]
  })
}


resource "aws_iam_group_policy_attachment" "secret_access" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.secret_access.arn
}