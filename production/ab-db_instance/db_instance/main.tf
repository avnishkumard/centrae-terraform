locals {

  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
  private_subnets = data.terraform_remote_state.network.outputs.private_subnets
  cidr_block = data.terraform_remote_state.network.outputs.vpc_cidr_block

}


module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"
  name = var.security_group_name

  description = "Complete MySQL example security group"
  vpc_id      = local.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MySQL access from within VPC"
      cidr_blocks = local.cidr_block
    },
  ]
  tags = merge(var.tags,
    {
        Usage="RDS Database rules"
    }
    )

}


module "db" {
  source = "terraform-aws-modules/rds/aws"


  # All available versions: http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_MySQL.html#MySQL.Concepts.VersionMgmt
  engine               = var.engine
  engine_version       = var.engine_varsion
  family               = var.db_family # DB parameter group
  major_engine_version = var.db_major_engine_version      # DB option group
  instance_class       = var.instance_type

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage

  identifier = var.db_name
  username = var.username
  port     = 3306

  multi_az               = false
  vpc_security_group_ids = [module.security_group.security_group_id]
  db_subnet_group_name = var.db_subnet_group_name


  create_db_subnet_group = true
  subnet_ids             = local.private_subnets

  maintenance_window              = var.maintenance_window
  backup_window                   = var.backup_window
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  create_cloudwatch_log_group     = true

  backup_retention_period = 30
  skip_final_snapshot     = true
  deletion_protection     = true

  performance_insights_enabled          = false
  performance_insights_retention_period = var.performance_insights_retention_period

  
  tags = merge(var.tags,{Usage="RDS Database"})
}
