resource "aws_security_group" "ecs_sec_group" {
  name        = var.sec_group_name
  description = "Allow http inbound traffic from ALB"

  #vpc_id      = aws_vpc.Prod-vpc.id
  vpc_id = local.vpc_id
  ingress {
    description     = "TLS from VPC"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [local.alb_sec_id]

    #cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge({
    Name = var.sec_group_name },
  var.tags)

}
