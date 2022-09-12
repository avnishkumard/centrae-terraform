resource "aws_ecs_service" "default" {
  name            = var.ecs_service_name
  cluster         = local.ecs_cluster_names[0]
  task_definition = aws_ecs_task_definition.task.arn
  launch_type     = "FARGATE"
  desired_count   = 0

  network_configuration {

    subnets          = local.private_subnets
    security_groups  = [aws_security_group.ecs_sec_group.id]
    assign_public_ip = false
  }
  #iam_role        = local.ecsTaskExecutionRole_arn
  depends_on = [local.ecsTaskExecutionRole_name]


  load_balancer {
    target_group_arn = local.tg_arn[0]
    container_name   = var.lb_container_name
    container_port   = var.lb_container_port
  }

  lifecycle {
    ignore_changes = [desired_count]
  }

}
