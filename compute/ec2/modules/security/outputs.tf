output "sg_id" {
  description = "ID of the created security group"
  value       = aws_security_group.ec2.id
}
