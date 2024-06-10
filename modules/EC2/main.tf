
#BASTION host to access ec2 instances
resource "tls_private_key" "aws_app_server_1_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "aws_app_server_1_key_pair" {
  key_name   = "aws_app_server_1_key"
  public_key = tls_private_key.aws_app_server_1_key.public_key_openssh
}
#BASTION host to access ec2 instances
resource "tls_private_key" "aws_app_server_2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "aws_app_server_2_key_pair" {
  key_name   = "aws_app_server_2_key"
  public_key = tls_private_key.aws_app_server_2_key.public_key_openssh
}

resource "aws_instance" "aws_app_server_1" {
  ami               = "ami-0bb84b8ffd87024d8"
  instance_type     = var.instance_type
  availability_zone = "us-east-1a"
  user_data         = templatefile("user_data.tpl", { efs_id = var.efs_id })
   key_name      = aws_key_pair.aws_app_server_1_key_pair.key_name

  subnet_id       = var.subnet_id_1
  security_groups = [var.ec2_sg_id]
  tags = {
    Name = "cloudcamp-final-project-ec2-instance-1"
  }
}

resource "aws_instance" "aws_app_server_2" {
  ami               = "ami-0bb84b8ffd87024d8"
  instance_type     = var.instance_type
  availability_zone = "us-east-1b"
  user_data         = templatefile("user_data.tpl", { efs_id = var.efs_id })
   key_name      = aws_key_pair.aws_app_server_2_key_pair.key_name
  subnet_id       = var.subnet_id_2
  security_groups = [var.ec2_sg_id]
  tags = {
    Name = "cloudcamp-final-project-ec2-instance-2"
  }
}

#BASTION host to access ec2 instances
resource "tls_private_key" "bastion_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "bastion_key_pair" {
  key_name   = "bastion-key"
  public_key = tls_private_key.bastion_key.public_key_openssh
}
# Bastion host instance
resource "aws_instance" "bastion" {
  ami             = "ami-0bb84b8ffd87024d8"
  instance_type   = var.bastion_instance_type
  subnet_id       = var.public_subnet_id
  security_groups = [var.bastion_sg_id]
  key_name      = aws_key_pair.bastion_key_pair.key_name

  tags = {
    Name = "BastionHost"
  }
}
