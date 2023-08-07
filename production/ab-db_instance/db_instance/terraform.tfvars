engine = "mysql"
engine_varsion ="8.0.30"
db_family ="mysql8.0"
db_major_engine_version ="8.0"
instance_type ="db.t3.micro"
allocated_storage =20
max_allocated_storage =1000
db_name ="ab-db-production"
username ="admin"
performance_insights_retention_period=7
tags = {
  Terraform   = true
  Environment = "Production"
}

security_group_name = "ab-prod-sg_rds"

maintenance_window = "Mon:00:00-Mon:03:00"
backup_window = "03:00-06:00"
enabled_cloudwatch_logs_exports  = ["general"]
backup_retention_period = 30
db_subnet_group_name = "prod-ab"
