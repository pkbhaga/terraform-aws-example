resource "aws_security_group" "redis" {
  name = format("%s-redis-sg", var.name)

  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = var.redis_port
    to_port     = var.redis_port
    protocol    = "tcp"
    cidr_blocks = module.vpc.private_subnets_cidr_blocks
  }

  tags = {
    Group = var.name
    Name  = "${var.name}-redis-sg"
    Owner = var.owner
  }
}

module "redis" {
  source                     = "git::https://github.com/cloudposse/terraform-aws-elasticache-redis.git?ref=master"
  availability_zones         = var.vpc_azs
  namespace                  = var.redis_namespace
  stage                      = var.redis_stage
  name                       = var.redis_name
  zone_id                    = var.redis_zone_id
  vpc_id                     = module.vpc.vpc_id
  allowed_security_groups    = [aws_security_group.redis.id]
  subnets                    = module.vpc.elasticache_subnets
  cluster_size               = var.redis_cluster_size
  instance_type              = var.redis_instance_type
  apply_immediately          = true
  automatic_failover_enabled = var.redis_automatic_failover_enable
  engine_version             = var.redis_engine_version
  family                     = var.redis_family
  at_rest_encryption_enabled = var.redis_at_rest_encryption_enabled
  transit_encryption_enabled = var.redis_transit_encryption_enabled
  replication_group_id       = "jsdjfjlkdsjlkfj"

  parameter = [
    {
      name  = "notify-keyspace-events"
      value = "lK"
    }
  ]

  tags = {
    Group = var.name
    Name  = "${var.name}-redis"
    Owner = var.owner
  }
}
