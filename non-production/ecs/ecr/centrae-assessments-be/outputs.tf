output "ecr_repo_name" {

value = aws_ecr_repository.ecr-repo.name
}
output "ecr_repo_url" {

value = aws_ecr_repository.ecr-repo.repository_url
}
