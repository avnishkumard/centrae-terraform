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
resource "aws_db_instance" "non-prod-database" {
  identifier             = "non-prod-database"
  instance_class         = var.instance_type
  allocated_storage      = var.storage
  engine                 = var.database_engine
  engine_version         = var.database_engine_ver
  username               = var.database_user_name
  password               = var.database_user_password
  db_subnet_group_name   = aws_db_subnet_group.non-prod-subnet-grp.name
  vpc_security_group_ids = [aws_security_group.database-1.id]
  publicly_accessible    = false
  backup_retention_period = 7
  parameter_group_name    = "default.mysql5.6"
}
resource "aws_db_snapshot" "database-1" {
  db_instance_identifier = aws_db_instance.non-prod-database.id
  db_snapshot_identifier = "non-prod-database_snapshot1234"
}

resource "aws_db_subnet_group" "non-prod-subnet-grp" {
  name       = "non-prod-subnet-grp"
  subnet_ids = [aws_subnet.non-prod-priv-a.id, aws_subnet.non-prod-priv-b.id,aws_subnet.non-prod-priv-c.id,aws_subnet.non-prod-priv-d.id]

  tags = {
    Name = " DB subnet group1"
  }
}

resource "aws_db_instance" "prod-database" {
  identifier             = "prod-database"
  instance_class         = var.instance_type
  allocated_storage      = var.storage
  engine                 = var.database_engine
  engine_version         = var.database_engine_ver
  username               = var.database_user_name
  password               = var.database_user_password
  db_subnet_group_name   = aws_db_subnet_group.prod-subnet-grp.name
  vpc_security_group_ids = [aws_security_group.database-1.id]
  publicly_accessible    = false
  backup_retention_period = 35
  parameter_group_name    = "default.mysql5.6"
}
resource "aws_db_snapshot" "database-2" {
  db_instance_identifier = aws_db_instance.prod-database.id
  db_snapshot_identifier = "prod-database_snapshot1234"
}
resource "aws_db_subnet_group" "prod-subnet-grp" {
  name       = "prod-subnet-grp"
  subnet_ids = [aws_subnet.prod-priv-a.id, aws_subnet.prod-priv-b.id,aws_subnet.prod-priv-c.id,aws_subnet.prod-priv-d.id]

  tags = {
    Name = " DB subnet group2"
  }
}
