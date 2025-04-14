variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "CIDR blocks for the subnets"
  type        = list(string)
}

variable "azs" {
  description = "Availability zones for the subnets"
  type        = list(string)
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}
