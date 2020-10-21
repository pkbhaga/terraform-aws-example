variable "region" {
  default = "us-east-1"
}

variable "name" {
  default = "terraform-aws-example"
}

variable "owner" {
  default = "terraform-aws-example"
}

variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCRQYYw42SeWm4SvTt4iipyjozdpaR5FlNeyo3oWYXF2W2Uur+XXJssFhxD8xf0NFKRtrK3wVZPkP/7k6+eRufC9Lq6VZvImlCTFJmEy+uHnA+vlkoXbUGk2zr7Cpct7udpZZxSivt+7lQ4avhBCQE/hw1qZxdGyZJY1Z1F3LGHCP55a+h5XxtaZR0eJQmejWnG9wq++iywdeOH2tCeOsnyNw1bjhYfydEDK7OAh/sZYsroxGpk/0SNFyscy/x2zEBrveDppE6QlH9pffx50mV00OgefHx2wpa95jwG7RWKvUkwqqMx1bEbg7tZ76PfNTM/rRg+EV9d1NMKQ3R5S1zT"
}

# VPC Variables
variable "vpc_env" {
  description = "VPC environment"
  default     = "dev"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  default     = "10.1.0.0/16"
}

variable "vpc_azs" {
  description = "A list of availability zones in the region"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_public_subnets" {
  description = "A list of public subnets inside the VPC"
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}

variable "vpc_private_subnets" {
  description = "A list of private subnets inside the VPC"
  default     = ["10.1.11.0/24", "10.1.12.0/24", "10.1.13.0/24"]
}

variable "vpc_database_subnets" {
  type        = list(string)
  description = "A list of database subnets"
  default     = ["10.1.21.0/24", "10.1.22.0/24", "10.1.23.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = true
}

variable "vpc_single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}

variable "vpc_one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`."
  default     = true
}

# DB

variable "db_name" {
  description = "The DB name to create"
  default     = "taws"
}

variable "db_env" {
  description = "The DB env to create"
  default     = "dev"
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
  default     = 5432
}

variable "db_preferred_maintenance_window" {
  description = "The window to perform maintenance in"
  default     = "Mon:00:00-Mon:03:00"
}

variable "db_preferred_backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled"
  default     = "01:00-06:00"
}

variable "db_backup_retention_period" {
  description = "The days to retain backups for"
  default     = 0
}

variable "db_engine" {
  description = "DB engine"
  default     = "aurora-mysql"
}

variable "db_engine_version" {
  description = "DB engine version"
  default     = "5.7.12"
}

variable "db_instance_class" {
  description = "DB instance class"
  default     = "db.t2.micro"
}

variable "db_cluster_count" {
  description = "DB Cluster Count"
  default     = "3"
}

variable "db_storage_encrypted" {
  description = "DB Storage Encrypted"
  default     = "true"
}

variable "db_monitoring_interval" {
  description = "DB Monitoring Interval"
  default     = "10"
}

# Memcached cluster

variable "memcached_namespace" {
  description = "Memcache cluster namespace"
  default     = "dev"
}

variable "memcached_stage" {
  description = "Memcache cluster stage"
  default     = "dev"
}

variable "memcached_port" {
  description = "Memcache port"
  default     = "11211"
}

variable "memcached_cluster_name" {
  description = "Memcache cluster name"
  default     = "terraform-aws-example-memcached-cluster"
}

variable "memcached_cluster_size" {
  description = "Memcache cluster size"
  default     = "3"
}

variable "memcached_instance_type" {
  description = "Memcache cluster instance type"
  default     = "t2.micro"
}

variable "memcached_engine_version" {
  description = "Memcache cluster engine version"
  default     = "1.5.16"
}

variable "memcached_zone_id" {
  description = "Memcache cluster engine version"
  default     = "memcached.tawsexample.com"
}

# Redis Cluster

variable "redis_namespace" {
  description = "Redis Cluster Namespace"
  default     = "terraform-aws-example-redis"
}

variable "redis_stage" {
  description = "Redis Cluster Stage"
  default     = "dev"
}

variable "redis_name" {
  description = "Redis Cluster name"
  default     = "redis-app"
}

variable redis_port {
  description = "Redis Cluster port"
  default     = "6379"
}

variable "redis_zone_id" {
  description = "Redis Cluster zone id"
  default     = "redis.terraform-aws.example.com"
}

variable "redis_cluster_size" {
  description = "Redis Cluster Size"
  default     = "3"
}

variable "redis_instance_type" {
  description = "Redis Cluster instance type"
  default     = "t2.micro"
}

variable "redis_automatic_failover_enable" {
  description = "Redis Cluster Automatic Failover Enable`"
  default     = "false"
}

variable "redis_engine_version" {
  description = "Redis Cluster Engine Version"
  default     = "4.0.10"
}

variable "redis_family" {
  description = "Redis Cluster Family"
  default     = "redis4.0"
}

variable "redis_at_rest_encryption_enabled" {
  description = "Redis Cluster Rest Encryption Enabled"
  default     = "false"
}

variable "redis_transit_encryption_enabled" {
  description = "Redis Cluster Transit Encryption Enabled"
  default     = "false"
}

# Backend App
variable "app_port" {
  description = "The port on which the application listens for connections"
  default     = 8080
}

variable "app_instance_type" {
  description = "The EC2 instance type for the application servers"
  default     = "t2.micro"
}

variable "app_autoscale_min_size" {
  description = "The fewest amount of EC2 instances to start"
  default     = 3
}

variable "app_autoscale_max_size" {
  description = "The largest amount of EC2 instances to start"
  default     = 6
}

variable "app_elb_health_check_interval" {
  description = "Duration between health checks"
  default     = 20
}

variable "app_elb_healthy_threshold" {
  description = "Number of checks before an instance is declared healthy"
  default     = 2
}

variable "app_elb_unhealthy_threshold" {
  description = "Number of checks before an instance is declared unhealthy"
  default     = 2
}

variable "app_elb_health_check_timeout" {
  description = "Interval between checks"
  default     = 5
}

variable "app_key_pair_name" {
  description = "Application instance key pair name"
  default     = "terraform"
}

# Web

variable "web_port" {
  description = "The port on which the web servers listen for connections"
  default     = 80
}

variable "web_instance_type" {
  description = "The EC2 instance type for the web servers"
  default     = "t2.micro"
}

variable "web_autoscale_min_size" {
  description = "The fewest amount of EC2 instances to start"
  default     = 3
}

variable "web_autoscale_max_size" {
  description = "The largest amount of EC2 instances to start"
  default     = 6
}

variable "web_elb_health_check_interval" {
  description = "Duration between health checks"
  default     = 20
}

variable "web_elb_healthy_threshold" {
  description = "Number of checks before an instance is declared healthy"
  default     = 2
}

variable "web_elb_unhealthy_threshold" {
  description = "Number of checks before an instance is declared unhealthy"
  default     = 2
}

variable "web_elb_health_check_timeout" {
  description = "Interval between checks"
  default     = 5
}

variable "web_key_pair_name" {
  description = "Application instance key pair name"
  default     = "terraform-aws-example"
}
