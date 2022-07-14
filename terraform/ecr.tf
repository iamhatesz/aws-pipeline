resource "aws_ecr_repository" "repository" {
  name = "aws-pipeline"
}

resource "aws_ecr_repository_policy" "repository_policy" {
  repository = aws_ecr_repository.repository.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "Developers have access to the registry"
        Principal = {
          AWS = "arn:aws:iam::${local.account_id}:user/${module.users.tomasz_wrona_name}"
        }
        Effect = "Allow"
        Action = [
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart",
        ]
      }
    ]
  })
}