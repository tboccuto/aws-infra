output "instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = module.ec2.instance_ids
}

output "instance_public_ips" {
  description = "Public IPs of the created EC2 instances"
  value       = module.ec2.instance_public_ips
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "IDs of the created subnets"
  value       = module.vpc.subnet_ids
}
