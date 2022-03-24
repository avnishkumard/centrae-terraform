#locals {
#vpc_id = data.terraform_remote_state.network.outputs.vpc_id
#}
resource "aws_security_group" "alb_group" {
  name        = "${var.alb-name}-sg"
  description = "ALB rules"
  vpc_id      = local.vpc_id

  ingress {
    description = "TLS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.alb_cidr_block]
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.alb_cidr_block]
  }
  tags = {
    Name        = "${var.env} LoadBalancer"
    Terraform   = "true"
    environment = var.env
  }
}
