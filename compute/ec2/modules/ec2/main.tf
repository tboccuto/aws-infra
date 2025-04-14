data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "main" {
  count = var.instance_count
  
  ami                    = var.ami_id != null ? var.ami_id : data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = element(var.subnet_ids, count.index % length(var.subnet_ids))
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name
  user_data              = var.user_data
  
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = true
  }
  
  tags = {
    Name        = "${var.instance_name}-${count.index + 1}"
    Environment = var.environment
  }
}
