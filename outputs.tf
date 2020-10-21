# ELB DNS Name
output "elb_dns_name" {
  value = module.elb_web.this_elb_dns_name
}

# aws_rds_cluster

output "auroradb_cluster_id" {
  description = "The ID of the cluster"
  value       = module.auroradb.this_rds_cluster_id
}

output "auroradb_cluster_resource_id" {
  description = "The Resource ID of the cluster"
  value       = module.auroradb.this_rds_cluster_resource_id
}

output "auroradb_cluster_endpoint" {
  description = "The cluster endpoint"
  value       = module.auroradb.this_rds_cluster_endpoint
}

#Redis Cluster Outputs

output "redis_cluster_id" {
  value       = module.redis.id
  description = "Redis cluster ID"
}

output "redis_cluster_endpoint" {
  value       = module.redis.endpoint
  description = "Redis primary endpoint"
}

output "redis_cluster_host" {
  value       = module.redis.host
  description = "Redis hostname"
}

#memcached cluster outputs

output "memcached_cluster_address" {
  value       = module.memcached.cluster_address
  description = "Cluster address"
}

output "memcached_cluster_configuration_endpoint" {
  value       = module.memcached.cluster_configuration_endpoint
  description = "Cluster configuration endpoint"
}

output "memcached_hostname" {
  value       = module.memcached.hostname
  description = "Cluster hostname"
}

output "memcached_cluster_urls" {
  value       = module.memcached.cluster_urls
  description = "Cluster URLs"
}
