variable "ab_task_cpu" {}
variable "ab_task_mem" {}
variable "log_group_name" {}
variable "tags" {}
variable "ab_family" {}
variable "ab_cd_cpu" {}
variable "ab_cd_mem" {}
variable "ab_cd_name" {}

variable "cd_portMappings" {}
variable "ab_ecs_service_name" {}
variable "ab_lb_container_name" {}
variable "ab_lb_container_port" {}
variable "ecs_cluster_key" {}
variable "awslogs-region" {}
variable "sec_group_name" {}

//variable "env_vars" {}
variable "ab_host_header_domain" {}
//variable "host_api_domain" {}
//variable "domain_name" {}
variable "lb_name" {}
variable "listener_arn" {}
variable "ab_image" {}