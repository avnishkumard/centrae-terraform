output "ecr_repo_name" {

value = aws_ecr_repository.ecr-repo.name
}
output "ecr_repo_url" {

value = aws_ecr_repository.ecr-repo.repository_url
}

output "ab_ecr_repo_name" {

value = aws_ecr_repository.ab-ecr-repo.name
}
output "ab_ecr_repo_url" {

value = aws_ecr_repository.ab-ecr-repo.repository_url
}
