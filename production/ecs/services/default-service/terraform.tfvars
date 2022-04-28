task_cpu       = 256
task_mem       = 512
family         = "nginx-service"
log_group_name = "/ecs/default-ecs-logs"

ecs_cluster_key="centrae-prod"

cd_cpu   = 256
cd_mem   = 512
cd_name  = "nginx-container"
cd_image = "nginx:latest"

cd_portMappings = [{
  containerPort = 80
  hostPort      = 80
}]

ecs_service_name = "initial-service"

lb_container_name = "nginx-container"
lb_container_port = "80"
tags = {
  Terraform   = true
  Environment = "Production"
}
