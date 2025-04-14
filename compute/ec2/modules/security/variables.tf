variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "allowed_ssh_ips" {
  description = "List of CIDR blocks allowed to SSH"
  type        = list(string)
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}
