resource "aws_ecs_cluster" "ecs-cluster" {
  #name = var.non-prod-cluster
  for_each = toset(var.cluster-names)

  name = each.key

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

# Create ECS service and Task definition below.


resource "aws_ecs_task_definition" "nginx" {
  family = var.ecs_task_definition_name

  container_definitions = jsonencode([
    {
      name      = var.ecs-container-name
      image     = var.ecs-container-image
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          #containerPort = var.container-port
          #hostPort = var.container-port
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])

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

role = aws_iam_role.ecs_role.id
policy_arn = "${data.aws_iam_policy.AmazonECSTaskExecutionRolePolicy.arn}"

}

resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs-service-name
  for_each = aws_ecs_cluster.ecs-cluster
  cluster         = each.value.id
  task_definition = aws_ecs_task_definition.nginx.arn
  desired_count   = 1
  #iam_role        = aws_iam_role.ecs_role.arn
  #depends_on      = [aws_iam_role.ecs_role]


  #load_balancer {
  #  target_group_arn = aws_lb_target_group.foo.arn
  #  container_name   = "mongo"
  #  container_port   = 8080
  #}

  lifecycle {
    ignore_changes = [desired_count, task_definition]
    }

}
