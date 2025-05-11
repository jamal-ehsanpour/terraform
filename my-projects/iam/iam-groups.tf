resource "aws_iam_group" "developers" {
  name = "Developers"
}

resource "aws_iam_user_group_membership" "dev_members" {
  for_each = aws_iam_user.users
  user     = each.value.name
  groups   = [aws_iam_group.developers.name]
}