tags = {
Terraform = true
Environment = "Non-Production"
}
vpc_name = "Non-Production"

vpc_cidr = "20.0.0.0/17"

availability-zones = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
public_subnets = [
  "20.0.8.0/21",
  "20.0.24.0/21",
  "20.0.40.0/21",
  "20.0.56.0/21",
]
private_subnets = [
  "20.0.16.0/21",
  "20.0.32.0/21",
  "20.0.48.0/21",
  "20.0.64.0/21"
]
#non-Prod-vpc = "vpc-07e026ed7db98072c"
#peer_cidr = "20.0.0.0/17"
