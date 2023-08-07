task_cpu       = 256
task_mem       = 512
family         = "centrae-assesments-be-prod"
log_group_name = "/ecs/centrae-assessments-be"

ecs_cluster_key = "Production"

cd_cpu  = 256
cd_mem  = 512
cd_name = "centrae-assessments-be"

cd_portMappings = [{
  containerPort = 80
  hostPort      = 80
}]

ecs_service_name = "centrae-assessments-be"

lb_container_name = "centrae-assessments-be"
lb_container_port = "80"
tags = {
  Terraform   = true
  Environment = "Production"
}
awslogs-region = "us-west-2"
sec_group_name = "assesments-be"
