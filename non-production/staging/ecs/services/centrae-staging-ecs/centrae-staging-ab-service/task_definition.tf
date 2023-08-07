resource "aws_ecs_task_definition" "ab_task" {
  cpu                      = var.ab_task_cpu
  memory                   = var.ab_task_mem
  family                   = var.ab_family
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

      name         = var.ab_cd_name
      image        = "670015515275.dkr.ecr.us-west-2.amazonaws.com/assessment-builder-api-staging:1a280b111ddf7beff56c7f6871d4004c8a7fd067"
      cpu          = var.ab_cd_cpu
      memory       = var.ab_cd_mem
      essential    = true
      //secrets      = var.env_vars
      portMappings = var.cd_portMappings
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.ab_log_group.name
          awslogs-region        = var.awslogs-region
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}
