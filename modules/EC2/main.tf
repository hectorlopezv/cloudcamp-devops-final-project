


resource "aws_instance" "aws_app_server_1" {
      ami = "ami-0bb84b8ffd87024d8"
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    user_data = templatefile("user_data.tpl", { efs_id = var.efs_id })

      subnet_id     = var.subnet_id_1
  security_groups = [var.ec2_sg_id]
    tags = {
      Name = "cloudcamp-final-project-ec2-instance-1"
    }
}

resource "aws_instance" "aws_app_server_2" {
      ami = "ami-0bb84b8ffd87024d8"
    instance_type = var.instance_type
    availability_zone = var.availability_zone
     user_data = templatefile("user_data.tpl", { efs_id = var.efs_id })

  subnet_id     = var.subnet_id_2
  security_groups = [var.ec2_sg_id]    
  tags = {
      Name = "cloudcamp-final-project-ec2-instance-2"
    }
}

#BASTION host to access ec2 instances
# Bastion host instance
resource "aws_instance" "bastion" {
  ami           = "ami-0bb84b8ffd87024d8"
  instance_type = var.bastion_instance_type
  key_name      = var.bastion_key_name
  subnet_id     = var.public_subnet_id
  security_groups = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "BastionHost"
  }
}
