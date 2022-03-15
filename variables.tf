variable "availability-zone-1" {
  type    = string
  default = "us-west-2a"
}
variable "availability-zone-2" {
  type    = string
  default = "us-west-2b"
}
variable "availability-zone-3" {
  type    = string
  default = "us-west-2c"
}
variable "availability-zone-4" {
  type    = string
  default = "us-west-2d"
}
variable "non-Prod-vpc" {
  default     = "20.0.0.0/17"
  description = "enter the production vpc"
}
variable "Prod-vpc" {
  default     = "20.0.128.0/17"
  description = "enter the non-production vpc"
}

variable "non-prod-subnet-1" {
  default     = "20.0.0.0/21"
  description = "enter the non-production subnet"
}
variable "non-prod-subnet-2" {
  default     = "20.0.8.0/21"
  description = "enter the non-production subnet"
}
variable "non-prod-subnet-3" {
  default     = "20.0.16.0/21"
  description = "enter the non-production subnet"
}
variable "non-prod-subnet-4" {
  default     = "20.0.24.0/21"
  description = "enter the non-production subnet"
}
variable "non-prod-subnet-5" {
  default     = "20.0.32.0/21"
  description = "enter the non-production subnet"
}
variable "non-prod-subnet-6" {
  default     = "20.0.40.0/21"
  description = "enter the non-production subnet"
}
variable "non-prod-subnet-7" {
  default     = "20.0.48.0/21"
  description = "enter the non-production subnet"
}
variable "non-prod-subnet-8" {
  default     = "20.0.56.0/21"
  description = "enter the non-production subnet"
}


variable "prod-subnet-1" {
  default     = "20.0.128.0/21"
  description = "enter the production subnet"
}
variable "prod-subnet-2" {
  default     = "20.0.136.0/21"
  description = "enter the production subnet"
}
variable "prod-subnet-3" {
  default     = "20.0.144.0/21"
  description = "enter the production subnet"
}
variable "prod-subnet-4" {
  default     = "20.0.152.0/21"
  description = "enter the production subnet"
}
variable "prod-subnet-5" {
  default     = "20.0.160.0/21"
  description = "enter the production subnet"
}
variable "prod-subnet-6" {
  default     = "20.0.168.0/21"
  description = "enter the production subnet"
}
variable "prod-subnet-7" {
  default     = "20.0.176.0/21"
  description = "enter the production subnet"
}
variable "prod-subnet-8" {
  default     = "20.0.184.0/21"
  description = "enter the production subnet"
}

variable "ecr-repository-name" {

  default     = "centrae-ecr"
  description = "ECR repository Name use tags like nginx:v2.4-alpine"

}

variable "tagged-image-count" {
  default     = 20
  description = "ECR untagged image count"
}

variable "untagged-image-days" {
  default     = 14
  description = "ECR tagged image count"
}

variable "cluster-names" {
  default     = ["centrae-non-prod", "centrae-prod"]
  description = "Cluster Names"
}


variable "non-prod-cluster" {

  default     = "centrae-non-prod"
  description = "Non Production cluster"
}

variable "prod-cluster" {

  default     = "centrae-prod"
  description = "Production cluster"
}

variable "ecs_task_definition_name" {

  default     = "nginx-service"
  description = "Ecs Task Definition name for the cluster"
}

variable "ecs-container-name" {

  default     = "nginx-container"
  description = "Ecs Task Definition container name"
}

variable "ecs-container-image" {

  default     = "nginx:latest"
  description = "Ecs Task Definition container image"
}

variable "ecs-service-name" {

  default     = "initial-service"
  description = "Ecs Task Definition container image"
}

variable "alb-s3-bucket-name" {
  default     = "alb-logs-centrae"
  description = "S3 Bucket for loadbalancer logs"
}

variable "alb-name" {
  default     = ["non-prod-alb", "prod-alb"]
  description = "AlB names"
}

variable "alb-log-prefix" {
  default     = ["non-prod", "prod"]
  description = "Load Balancer S3 prefix"
}

variable "alb_cidr_block" {

  default     = "0.0.0.0/0"
  description = "ALB ingress CIDR block"
}

variable "ecs_task_cpu" {
default = 256
}
variable "ecs_task_memory" {
default = 512
}

variable "ecs_container_cpu" {
default = 256
}
variable "ecs_container_memory" {
default = 512
}
variable "storage" {
  default = 5
  description = "give the database instance allocated_storage in gbs" 
}
variable "instance_type" {
  default = "db.t2.micro"
  description = "give the database instance_type"
}

variable "database_engine"{
  default = "mysql"
  description = "give the database instance_engine "
}

variable "database_engine_ver"{
  default = 5.7
  description = "give the database instance engine engine version "
}

variable "database_user_name"{
  default = "asf"
  description = "give the database username"
}

variable "database_user_password"{
  default = "afdadfada"
  description = "give the database password"
}


variable "s3_bucket_name" {
  type    = list
  default = ["prod_bucket", "stage-bucket", "qa_bucket"]
}