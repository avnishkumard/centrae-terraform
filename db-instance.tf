resource "aws_db_instance" "non-prod-database" {
  identifier             = "non-prod-database"
  instance_class         = var.instance_type
  allocated_storage      = var.storage
  engine                 = var.database_engine
  engine_version         = var.database_engine_ver
  username               = var.database_user_name
  password               = var.database_user_password
  db_subnet_group_name   = [aws_db_subnet_group.db-private-subnet1.Name]
  vpc_security_group_ids = [aws_security_group.rds-security.id]
  publicly_accessible    = false
  skip_final_snapshot    = true
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
  db_subnet_group_name   = [aws_db_subnet_group.db-private-subnet1.Name]
  vpc_security_group_ids = [aws_security_group.rds-security.id]
  publicly_accessible    = false
  skip_final_snapshot    = true
}

resource "aws_db_subnet_group" "prod-subnet-grp" {
  name       = "prod-subnet-grp"
  subnet_ids = [aws_subnet.prod-priv-a.id, aws_subnet.prod-priv-b.id,aws_subnet.prod-priv-c.id,aws_subnet.prod-priv-d.id]

  tags = {
    Name = " DB subnet group2"
  }
}