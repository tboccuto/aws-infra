output "instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = aws_instance.main[*].id
}

output "instance_public_ips" {
  description = "Public IPs of the created EC2 instances"
  value       = aws_instance.main[*].public_ip
}
