variable "ecs_cluster" {}

variable "tags" {}

variable "ecs_task_definition_name" {

  description = "Demo task"
}

#variable "ecs_task_cpu" {}
#variable "ecs_task_memory" {}
#variable "ecs_container_cpu" {}
#variable "ecs_container_memory" {}
#variable "ecs-container-name" {}
#variable "ecs-container-image" {}

variable "ecs_log_group" {}

variable "task_definitions" {}
