#################################################################################
## This file initializes the variables required for creating infrastructure    ##
## We are hardcoding all the values, but in ideal way we can make it dynamic   ##
#################################################################################

#Initialize the base variables such as region, name for terraform backend
name       = "terraform-aws-example"
region     = "us-east-1"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCRQYYw42SeWm4SvTt4iipyjozdpaR5FlNeyo3oWYXF2W2Uur+XXJssFhxD8xf0NFKRtrK3wVZPkP/7k6+eRufC9Lq6VZvImlCTFJmEy+uHnA+vlkoXbUGk2zr7Cpct7udpZZxSivt+7lQ4avhBCQE/hw1qZxdGyZJY1Z1F3LGHCP55a+h5XxtaZR0eJQmejWnG9wq++iywdeOH2tCeOsnyNw1bjhYfydEDK7OAh/sZYsroxGpk/0SNFyscy/x2zEBrveDppE6QlH9pffx50mV00OgefHx2wpa95jwG7RWKvUkwqqMx1bEbg7tZ76PfNTM/rRg+EV9d1NMKQ3R5S1zT"
owner      = "terraform-aws-example"

#Initialize all the Networking variables required - VPC
#In this architecture we spread across two availability zones for stronger infrastructure availability
vpc_env                    = "dev"
vpc_azs                    = ["us-east-1a", "us-east-1b", "us-east-1c"]
vpc_cidr                   = "10.1.0.0/16"
vpc_private_subnets        = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
vpc_public_subnets         = ["10.1.11.0/24", "10.1.12.0/24", "10.1.13.0/24"]
vpc_database_subnets       = ["10.1.21.0/24", "10.1.22.0/24", "10.1.23.0/24"]
vpc_enable_nat_gateway     = true
vpc_one_nat_gateway_per_az = true
vpc_single_nat_gateway     = false

#Initialize all the Compute variables required for worker and application clusters - EC2

#Application Server EC2 specific values
app_port          = "9091"
app_instance_type = "t2.micro"

#Application Server ASG specific values
app_autoscale_min_size = "2"
app_autoscale_max_size = "3"

#Application Server ELB specific values
app_elb_health_check_interval = "30"
app_elb_healthy_threshold     = "2"
app_elb_unhealthy_threshold   = "3"
app_elb_health_check_timeout  = "10"

#Web Server EC2 specific values
web_port          = "8080"
web_instance_type = "t2.micro"

#Web Server ASG specific values
web_autoscale_min_size = "2"
web_autoscale_max_size = "3"

#Web ELB specific values
web_elb_health_check_interval = "30"
web_elb_healthy_threshold     = "2"
web_elb_unhealthy_threshold   = "3"
web_elb_health_check_timeout  = "10"

# RDS Aurora DB
db_name                         = "aurora-db-example"
db_env                          = "dev"
db_engine                       = "aurora-mysql"
db_engine_version               = "5.7.12"
db_instance_class               = "db.t2.micro"
db_cluster_count                = "3"
db_port                         = "5432"
db_storage_encrypted            = "true"
db_monitoring_interval          = "10"
db_preferred_backup_window      = "01:00-06:00"
db_backup_retention_period      = "0"
db_preferred_maintenance_window = "Mon:00:00-Mon:03:00"

# Memcached Cluster
memcached_namespace      = "dev"
memcached_stage          = "dev"
memcached_cluster_name   = "terraform-aws-example-memcached-cluster"
memcached_cluster_size   = "3"
memcached_instance_type  = "t2.micro"
memcached_engine_version = "1.5.16"
memcached_zone_id        = "memcached.tawsexample.com"
memcached_port           = "11211"

# Redis Cluster
redis_namespace                  = "terraform-aws-example-redis"
redis_stage                      = "dev"
redis_port                       = "6379"
redis_name                       = "redis-app"
redis_zone_id                    = "redis.terraform-aws.example.com"
redis_cluster_size               = "3"
redis_instance_type              = "t2.micro"
redis_automatic_failover_enable  = "false"
redis_engine_version             = "4.0.10"
redis_family                     = "redis4.0"
redis_at_rest_encryption_enabled = "false"
redis_transit_encryption_enabled = "false"
