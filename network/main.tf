

module "vpc" {

  source = "terraform-aws-modules/vpc/aws"

  name = "Prod-vpc_"

  cidr = var.Prod-vpc

  azs = var.availability-zones

  private_subnets = var.private_subnets

  public_subnets = var.public_subnets

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  #reuse_nat_ips       = true
  #external_nat_ip_ids = [aws_eip.natgw_p.id]


  enable_dns_hostnames = true
  enable_dns_support   = true

  default_route_table_routes = [{
    cidr_block = var.peer_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.non-prod_and_prod-vpc-peer.id
     }
    ]

  enable_vpn_gateway = false

  manage_default_route_table = true

  default_route_table_tags = {
    Name = "Default Route"
  }
  igw_tags = {
    Name = "Prod-igw"
    }

  nat_eip_tags = {
    used_by     = "Prod NAT"
    Environment = "production"
  }

  tags = {
    Terraform   = "true"
    Environment = "Production"

  }
}

# Setup a VPC peering connection here.
resource "aws_vpc_peering_connection" "non-prod_and_prod-vpc-peer" {
  peer_vpc_id = module.vpc.vpc_id
  vpc_id      = var.non-Prod-vpc
  auto_accept = true
    

accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Terraform = "true"
    Name = "VPC Peering"
  }
}

resource "aws_route" "vpc_peering_routes_private" {
  #count                     = length(var.private_subnets)
  route_table_id = module.vpc.private_route_table_ids[0]
  destination_cidr_block    = var.peer_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.non-prod_and_prod-vpc-peer.id
}