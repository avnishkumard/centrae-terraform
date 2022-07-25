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
variable "domain_name" {}
variable "lb_name" {}
variable "listener_arn" {}