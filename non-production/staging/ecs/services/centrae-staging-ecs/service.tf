resource "aws_ecs_service" "default" {
  name            = var.ecs_service_name
  cluster         = local.ecs_cluster_map["${var.ecs_cluster_key}"]
  tags = var.tags
  task_definition = aws_ecs_task_definition.task.arn
  launch_type     = "FARGATE"
  desired_count   = 1
  health_check_grace_period_seconds = 60 
  network_configuration {

    subnets          = [local.private_subnets[0]]
    security_groups  = [aws_security_group.ecs_sec_group.id]
    assign_public_ip = false
  }
  #iam_role        = local.ecsTaskExecutionRole_arn
  depends_on = [local.ecsTaskExecutionRole_name, aws_lb_listener.test]


  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = var.lb_container_name
    container_port   = var.lb_container_port
  }

  lifecycle {
    ignore_changes = [desired_count]
  }

}
