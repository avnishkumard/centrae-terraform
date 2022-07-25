# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

# Subnets

output "private_subnets" {
value = module.vpc.private_subnets
description = "Private subnet"
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}
# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

output "public_route_table_ids" {
  value = module.vpc.public_route_table_ids
  description = "List of IDs of public route tables"
}
output "private_route_table_ids" {
  value = module.vpc.private_route_table_ids
  description = "List of IDs of private route tables"
}
