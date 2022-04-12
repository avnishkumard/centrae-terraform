ecs_cluster = ["centrae-prod"]

tags = {
  Terraform   = true
  Environment = "Production"
  Name        = "ECS Cluster"
}

ecs_task_definition_name = "nginx-service"
ecs_log_group = {
default = "/ecs/default-ecs-logs"
}

#ecs_task_cpu         = [256]
#ecs_task_memory      = [512]
#ecs_container_cpu    = [256]
#ecs_container_memory = [512]
#ecs-container-name   = ["nginx-container"]
#ecs-container-image  = ["nginx:latest"]

task_definitions = {
  task1 = {
    family = "nginx-service"
    cpu = 256
    memory = 512
    container_definition = [{
      name      = "nginx-container"
      image     = "nginx:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [{
        containerPort = 80
        "hostPort"    = 80
      }]
    logConfiguration = {
    logDriver = "awslogs"
    options = {
        awslogs-group = "/ecs/default-ecs-logs",
        awslogs-region = "us-west-2",
        awslogs-stream-prefix = "ecs"
    }
    }
    }]
  }
}
