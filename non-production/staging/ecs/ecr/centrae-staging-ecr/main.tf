resource "aws_ecr_repository" "ecr-repo" {
  name                 = var.ecr-repository-name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = merge(var.tags)
}
/*
resource "aws_ecr_lifecycle_policy" "ecr-repo-policy-staging" {
  repository = aws_ecr_repository.ecr-repo.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last 30 images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["latest"],
                "countType": "imageCountMoreThan",
                "countNumber": ${var.tagged-image-count}
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 2,
            "description": "Expire untagged images older than 14 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": ${var.untagged-image-days}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
    }
EOF
}
*/

//AB ecr_repo
resource "aws_ecr_repository" "ab-ecr-repo" {
  name                 = var.ab-ecr-repository-name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = merge(var.tags)
}
/*
resource "aws_ecr_lifecycle_policy" "ecr-repo-policy-staging" {
  repository = aws_ecr_repository.ecr-repo.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last 30 images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["latest"],
                "countType": "imageCountMoreThan",
                "countNumber": ${var.tagged-image-count}
            },
            "action": {
                "type": "expire"
            }
        },
        {
            "rulePriority": 2,
            "description": "Expire untagged images older than 14 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": ${var.untagged-image-days}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
    }
EOF
}
*/