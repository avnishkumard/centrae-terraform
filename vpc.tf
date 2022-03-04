resource "aws_vpc" "non-Prod-vpc" {
  cidr_block = var.non-Prod-vpc

  tags = {
    Name = "non-prod-vpc_"
  }
}

resource "aws_vpc" "Prod-vpc" {
  cidr_block = var.Prod-vpc

  tags = {
    Name = "Prod-vpc_"
  }
}
resource "aws_vpc_peering_connection" "non-prod_and_prod-vpc-peer" {
  peer_vpc_id   = aws_vpc.Prod-vpc.id
  vpc_id        = aws_vpc.non-Prod-vpc.id
  auto_accept   = true

  tags = {
    Name = "VPC Peering"
  }
}