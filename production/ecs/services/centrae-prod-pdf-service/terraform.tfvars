task_cpu       = 256
task_mem       = 512
family         = "centrae-prod-pdf-service"
log_group_name = "/ecs/centrae-prod-pdf-service"

ecs_cluster_key = "Production"

cd_cpu  = 256
cd_mem  = 512
cd_name = "centrae-prod-pdf-service"

cd_portMappings = [{
  containerPort = 80
  hostPort      = 80
}]

ecs_service_name = "centrae-prod-pdf-service"

lb_container_name = "centrae-prod-pdf-service"
lb_container_port = "80"
tags = {
  Terraform   = true
  Environment = "Production"
}
awslogs-region = "us-west-2"
sec_group_name = "ab-prod-assesments-be"
