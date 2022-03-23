variable "vpc-name" {}

variable "Prod-vpc" {}

variable "availability-zones" {}

variable "public_subnets" {}

variable "private_subnets" {}

variable "non-Prod-vpc" {
description = "Hardcoded ID for now"
}

variable "peer_cidr" {}
