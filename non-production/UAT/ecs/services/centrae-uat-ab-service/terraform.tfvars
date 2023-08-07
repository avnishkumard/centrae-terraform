ab_task_cpu       = 1024
ab_task_mem       = 2048
ab_family         = "centrae-uat-ab-service"

ecs_cluster_key = "UAT"
ab_cd_cpu  = 512
ab_cd_mem  = 1024
ab_cd_name = "centrae-uat-ab-service"
log_group_name = "/ecscentrae-ab-uat"

cd_portMappings = [{
  containerPort = 80
  hostPort      = 80
}]
ab_ecs_service_name = "centrae-uat-ab-service"
ab_lb_container_name = "centrae-uat-ab-service"
ab_lb_container_port = "80"
tags = {
  Terraform   = true
  Environment = "uat"
}
awslogs-region = "us-west-2"
sec_group_name = "ecs-ab-uat"
ab_host_header_domain = "api.ab-uat.centrae.com"

lb_name = "Non-Production"
listener_arn = "arn:aws:elasticloadbalancing:us-west-2:670015515275:listener/app/Non-Production/b0146169d825fc87/2bbb8a1721a1a531"

ab_image = "670015515275.dkr.ecr.us-west-2.amazonaws.com/assessment-builder-api-staging:1a280b111ddf7beff56c7f6871d4004c8a7fd067"

