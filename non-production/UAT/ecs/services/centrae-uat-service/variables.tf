variable "task_cpu" {}
variable "task_mem" {}
variable "log_group_name" {}
variable "tags" {}
variable "family" {}
variable "cd_cpu" {}
variable "cd_mem" {}
variable "cd_name" {}

variable "cd_portMappings" {}
variable "ecs_service_name" {}
variable "lb_container_name" {}
variable "lb_container_port" {}
variable "ecs_cluster_key" {}
variable "awslogs-region" {}
variable "sec_group_name" {}

variable "env_vars" {}
variable "host_header_domain" {}
variable "host_api_domain" {}
variable "domain_name" {}
variable "lb_name" {}
variable "listener_arn" {}

//ab
/*variable "ab_ecs_service_name" {}
variable "ab_task_cpu" {}
variable "ab_task_mem" {}
variable "ab_family" {}
variable "ab_lb_container_port" {}
variable "ab_cd_cpu" {}
variable "ab_cd_mem" {}
variable "ab_cd_name" {}
variable "ab_lb_container_name" {}
variable "ab_host_header_domain" {}*/