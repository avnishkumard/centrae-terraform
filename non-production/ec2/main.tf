locals {
public_subnets = data.terraform_remote_state.network.outputs.public_subnets

}

resource "aws_network_interface" "ec2" {
  subnet_id   = local.public_subnets[0]

  tags = merge({
    Name = "primary_network_interface"
  },var.tags)
}


resource "aws_instance" "web" {
  ami           = "ami-0207adfd491da4592"
  instance_type = "t3a.micro"

  tags = merge(var.tags,
    {Name = "test-ec2"})

  network_interface {
    network_interface_id = aws_network_interface.ec2.id
    device_index         = 0
  }
  key_name = "test-ec2"

}
