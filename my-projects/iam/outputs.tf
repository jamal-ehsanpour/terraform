output "user_arns" {
  description = "Map of created IAM user ARNs"
  value       = { for u, user in aws_iam_user.users : u => user.arn }
}

output "group_arns" {
  description = "Map of created IAM group ARNs"
  value       = { for g, group in aws_iam_group.group : g => group.arn }
}

output "secret_arns" {
  description = "Map of Secrets Manager ARNs containing user credentials"
  value       = { for u, secret in aws_secretsmanager_secret.user-secrets : u => secret.arn }
  sensitive   = true
}

output "encrypted_passwords" {
  description = "Map of PGP-encrypted passwords for users with console access"
  value       = { for u, profile in aws_iam_user_login_profile.logins : u => profile.encrypted_password }
  sensitive   = true
}
