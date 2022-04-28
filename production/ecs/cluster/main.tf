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
  name = "ecsTaskRole"

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


resource "aws_iam_role_policy_attachment" "ecs-task-execution-policy-attach" {

  role       = aws_iam_role.ecs_role.id
  policy_arn = data.aws_iam_policy.AmazonECSTaskExecutionRolePolicy.arn

}

#resource "aws_security_group" "ecs_sec_group" {
#  name        = "http-prod"
#  description = "Allow http inbound traffic"
#
#  #TODO switch to loadbalancer here
#  #vpc_id      = aws_vpc.Prod-vpc.id
#  vpc_id = local.vpc_id
#  ingress {
#    description = "TLS from VPC"
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  tags = merge({
#    Name = "prod-http" },
#  var.tags)
#
#}

#locals {
#
#service_data = {
#
#    task_definition = [for task in aws_ecs_task_definition.tasks: task.arn]
#}
#
#}

#resource "aws_cloudwatch_log_group" "log_group" {
#  name = each.key
#  tags = merge(var.tags)
  
#}
#resource "aws_ecs_service" "default" {
#  name = var.ecs-service-name
#  #for_each = aws_ecs_cluster.ecs-cluster
#  #for_each = aws_ecs_task_definition.tasks 
#  cluster         = aws_ecs_cluster.ecs-cluster.id
#  task_definition = aws_ecs_task_definition.tasks.arn
#  launch_type     = "FARGATE"
#  desired_count = 0
#
#  network_configuration {
#
#    subnets = locals.private_subnets
#    security_groups = [aws_security_group.ecs_sec_group.id]
#    assign_public_ip = false
#  }
#  iam_role        = aws_iam_role.ecs_role.arn
#  depends_on      = [aws_iam_role.ecs_role]
#
#
#  load_balancer {
#    target_group_arn = local.tg
#    container_name   = ""
#    container_port   = 80
#  }
#
#  lifecycle {
#    ignore_changes = [desired_count]
#  }
#
#}

