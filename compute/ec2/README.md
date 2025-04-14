# Modular EC2 Terraform Configuration

This repository contains a Terraform configuration for provisioning AWS EC2 instances with all necessary supporting infrastructure.

## Features

- Architecture deploy VPC, security, and EC2 resources
- Multi-environment support (dev, staging, production)
- Configurable instance types, AMIs, and counts
- Auto-selects latest Amazon Linux 3 AMI when none specified
- Distributes instances across availability zones
- Encrypted EBS volumes
- Client specified security groups

## Prerequisites

- Terraform v1.0+
- AWS CLI configured with appropriate credentials, and Iam
- Basic knowledge of AWS and Terraform

## Structure

```
project/
├── main.tf         # Main entry point that calls modules
├── variables.tf    # Global variables
├── outputs.tf      # Global outputs
├── terraform.tfvars # Variable values (not included in version control)
└── modules/
    ├── vpc/        # VPC module
    ├── security/   # Security groups module
    └── ec2/        # EC2 instance module
```

## Quick Start

1. Clone the repository
2. Create a `terraform.tfvars` file with your configuration
3. Initialize, plan, and apply:

```bash
terraform init
terraform plan #Plan: 9 to add, 0 to change, 0 to destroy.
terraform apply
```

## Configuration

Create a `terraform.tfvars` file with the following variables:

```hcl
aws_region       = "us-east-1"
vpc_cidr         = "10.0.0.0/16"
vpc_name         = "prod-vpc"
subnet_cidrs     = ["10.0.1.0/24", "10.0.2.0/24"]
azs              = ["us-east-1a", "us-east-1b"]
environment      = "prod"
allowed_ssh_ips  = ["123.123.123.123/32"]  # Your IP for SSH access
instance_count   = 2
instance_type    = "t3a.medium"
ami_id           = "ami-0c55b159cbfafe1f0"  # Optional, will auto-select latest if not specified
key_name         = "my-key-pair"
root_volume_size = 50
root_volume_type = "gp3"
instance_name    = "web-server"
user_data = <BashScriptForOSConfigs>
```

## Modules
### VPC Module
Creates a VPC with specified CIDR block, subnets across multiple availability zones, internet gateway, and route tables.

### Security Module

Creates security groups with rules for SSH, HTTP, and HTTPS access. SSH access can be restricted to specific IP addresses.

### EC2 Module

Provisions EC2 instances with specified instance type, AMI, volume size, and other parameters. Distributes instances across available subnets.

## Outputs

- `instance_ids`: IDs of created EC2 instances
- `instance_public_ips`: Public IPs of created EC2 instances
- `vpc_id`: ID of created VPC
- `subnet_ids`: IDs of created subnets

## Common Tasks

### Adding a New Environment

Create a new `terraform.tfvars` file for each environment and use Terraform workspaces:

```bash
terraform workspace new staging
terraform apply -var-file=staging.tfvars
```

### Scaling Instance Count

Update the `instance_count` variable in your `terraform.tfvars` file and run:

```bash
terraform apply
```

### Customizing Security Rules

Modify the security module's `main.tf` file to add or remove ingress/egress rules.

## Some Considerations 

- Store `terraform.tfvars` files outside version control
- Use a remote state backend for team collaboration
- Lock Terraform module versions
- Use separate AWS accounts for different environments

