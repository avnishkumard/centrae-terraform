ab_task_cpu       = 1024
ab_task_mem       = 2048
ab_family         = "centrae-staging-pdf-service"

ecs_cluster_key = "Staging"
ab_cd_cpu  = 512
ab_cd_mem  = 1024
ab_cd_name = "centrae-staging-pdf-service"
log_group_name = "/ecscentrae-pdf-uat"

cd_portMappings = [{
  containerPort = 80
  hostPort      = 80
}]
ab_ecs_service_name = "centrae-staging-pdf-service"
ab_lb_container_name = "centrae-staging-pdf-service"
ab_lb_container_port = "80"
tags = {
  Terraform   = true
  Environment = "Staging"
}
awslogs-region = "us-west-2"
sec_group_name = "ecs-ab-uat"
ab_host_header_domain = "api.pdf-Staging.centrae.com"

lb_name = "Non-Production"
listener_arn = "arn:aws:elasticloadbalancing:us-west-2:670015515275:listener/app/Non-Production/b0146169d825fc87/2bbb8a1721a1a531"

ab_image = "670015515275.dkr.ecr.us-west-2.amazonaws.com/assessment-builder-api-staging:1a280b111ddf7beff56c7f6871d4004c8a7fd067"

