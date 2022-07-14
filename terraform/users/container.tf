resource "aws_iam_user" "container" {
  name = "container"
}

resource "aws_iam_access_key" "container" {
  user = aws_iam_user.container.name
}

resource "aws_iam_user_policy" "container" {
  user = aws_iam_user.container.name
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
