resource "aws_security_group" "memcached" {
  name = format("%s-memcached-sg", var.name)

  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = var.memcached_port
    to_port     = var.memcached_port
    protocol    = "tcp"
    cidr_blocks = module.vpc.private_subnets_cidr_blocks
  }

  tags = {
    Group = var.name
    Name  = "${var.name}-memcached-sg"
  }
}

module "memcached" {
  source                  = "git::https://github.com/cloudposse/terraform-aws-elasticache-memcached.git?ref=master"
  namespace               = var.memcached_namespace
  stage                   = var.memcached_stage
  name                    = var.memcached_cluster_name
  availability_zones      = var.vpc_azs
  vpc_id                  = module.vpc.vpc_id
  allowed_security_groups = [aws_security_group.memcached.id]
  subnets                 = module.vpc.private_subnets
  cluster_size            = var.memcached_cluster_size
  instance_type           = var.memcached_instance_type
  engine_version          = var.memcached_engine_version
  apply_immediately       = true
  zone_id                 = var.memcached_zone_id
}
