vpc-name = "Prod-vpc_"

Prod-vpc = "20.0.128.0/17"

availability-zones = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
public_subnets = [
  "20.0.128.0/21",
  "20.0.144.0/21",
  "20.0.160.0/21",
  "20.0.176.0/21",
]
private_subnets = [
  "20.0.136.0/21",
  "20.0.152.0/21",
  "20.0.168.0/21",
  "20.0.184.0/21"
]
non-Prod-vpc = "vpc-00b2f03fc8424e62c"
peer_cidr = "20.0.0.0/17"
