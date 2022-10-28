locals {

  vpc_id          = data.terraform_remote_state.network.outputs.vpc_id
  private_subnets = data.terraform_remote_state.network.outputs.private_subnets
  public_subnets  = data.terraform_remote_state.network.outputs.public_subnets

}

resource "aws_ecs_cluster" "ecs-cluster" {

  for_each = toset(var.ecs_cluster)
  name     = each.key

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = merge(var.tags)

}


resource "aws_iam_role" "ecs_role" {
  name = "ecsProductionTaskRole"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2008-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    description = "Cluster assume role"
  }
}

data "aws_iam_policy" "AmazonECSTaskExecutionRolePolicy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


data "aws_iam_policy" "SecretsPolicy" {
  arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

resource "aws_iam_role_policy_attachment" "ecs-task-execution-policy-attach" {

  role       = aws_iam_role.ecs_role.id
  policy_arn = data.aws_iam_policy.AmazonECSTaskExecutionRolePolicy.arn

}
resource "aws_iam_role_policy_attachment" "ecs-task-secrets-policy" {

  role       = aws_iam_role.ecs_role.id
  policy_arn = data.aws_iam_policy.SecretsPolicy.arn

}
