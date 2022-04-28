task_cpu       = 256
task_mem       = 512
family         = "centrae-assesments-be-non-prod"
log_group_name = "/ecs/centrae-assessments-be-non-prod"

ecs_cluster_key = "Development"

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
  Environment = "Non-Production"
}
awslogs-region = "us-west-2"
sec_group_name = "assesments-be"

env_vars = [
  {
    name = "DB_HOST",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:DB_HOST::"
  },{
    name = "DB_NAME",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:DB_NAME::"
  },  {
    name = "DB_PASSWORD",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:DB_PASSWORD::"
  }, {
    name = "DB_USER",
    valueFrom = "arn:aws:secretsmanager:us-west-2:670015515275:secret:Development-fo2kF1:DB_USER::"
  }
]
