resource "aws_iam_group" "developers" {
  name = "developers"
}

resource "aws_iam_group_policy" "developers" {
  name = "developers"
  group  = aws_iam_group.developers.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user" "tomasz_wrona" {
  name = "tomasz_wrona"
}

resource "aws_iam_access_key" "tomasz_wrona" {
  user = aws_iam_user.tomasz_wrona.name
}

resource "aws_iam_user_group_membership" "tomasz_wrona" {
  user   = aws_iam_user.tomasz_wrona.name
  groups = [
    aws_iam_group.developers.name,
  ]
}

output "tomasz_wrona_name" {
  value = aws_iam_user.tomasz_wrona.name
}

output "tomasz_wrona_access_key_id" {
  value = aws_iam_access_key.tomasz_wrona.id
  sensitive = true
}

output "tomasz_wrona_access_key_secret" {
  value = aws_iam_access_key.tomasz_wrona.secret
  sensitive = true
}