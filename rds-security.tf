resource "aws_security_group" "database-1" {
  name = "database-1"

  description = "RDS postgres servers (terraform-managed)"
  vpc_id = "aws_vpc.db.id"

  # Only postgres in
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
} 