resource "aws_ecs_task_definition" "task" {
  cpu                      = var.task_cpu
  memory                   = var.task_mem
  family                   = var.family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = local.ecsTaskExecutionRole_arn
  #container_definitions = jsonencode(
  #  each.value.container_definition
  #  )
  #lifecycle {
  #  ignore_changes = [arn]
  #  }

  container_definitions = jsonencode([
    {

      name         = var.cd_name
      image        = "${local.repository_url}:latest"
      cpu          = var.cd_cpu
      memory       = var.cd_mem
      essential    = true
      secrets  = var.env_vars
      portMappings = var.cd_portMappings
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.log_group.name
          awslogs-region        = var.awslogs-region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}
