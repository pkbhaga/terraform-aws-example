resource "aws_security_group" "auroradb" {
  name = format("%s-aurora-db-sg", var.name)

  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = module.vpc.private_subnets_cidr_blocks
  }

  tags = {
    Group = var.name
    Name  = "${var.name}-aurora-db-sg"
    Owner = var.owner
  }
}

module "auroradb" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 2.0"

  name              = var.db_name
  engine            = var.db_engine
  engine_version    = var.db_engine_version
  instance_type     = var.db_instance_class
  storage_encrypted = var.db_storage_encrypted
  replica_count     = var.db_cluster_count
  subnets           = module.vpc.database_subnets
  vpc_id            = module.vpc.vpc_id

  allowed_security_groups = [aws_security_group.auroradb.id]
  allowed_cidr_blocks     = [var.vpc_cidr]
  apply_immediately       = true
  monitoring_interval     = var.db_monitoring_interval

  preferred_maintenance_window = var.db_preferred_maintenance_window
  preferred_backup_window      = var.db_preferred_backup_window

  # disable backups to create DB faster
  backup_retention_period = var.db_backup_retention_period

  db_parameter_group_name         = "terraform-aws-example"
  db_cluster_parameter_group_name = "terraform-aws-example"

  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]

  tags = {
    Environment = var.db_env
    Name        = "${var.name}-aurora-db"
    Owner       = var.owner
  }
}
