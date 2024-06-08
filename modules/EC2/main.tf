data "template_file" "user_data" {
  template = <<-EOF
    #!/bin/bash
    sudo dnf update -y
    sudo dnf install -y amazon-efs-utils

    # Crear la carpeta del código de la aplicación y la carpeta env
    sudo mkdir -p /home/ec2-user/app/env
    sudo chown -R ec2-user:ec2-user /home/ec2-user/app

    # Montar el sistema de archivos EFS
    sudo mount -t efs ${var.efs_id}:/ /home/ec2-user/app/env

    # Asegurar que el montaje persista después de reiniciar
    echo "${var.efs_id}:/ /home/ec2-user/app/env efs defaults,_netdev 0 0" | sudo tee -a /etc/fstab

    # Instalar Python 3 y Git
    sudo dnf install -y python3 git
  EOF
}

resource "aws_instance" "aws_app_server_1" {
      ami = "ami-0bb84b8ffd87024d8"
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    user_data = data.template_file.user_data.rendered
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
    user_data = data.template_file.user_data.rendered
  subnet_id     = var.subnet_id_2
  security_groups = [var.ec2_sg_id]    
  tags = {
      Name = "cloudcamp-final-project-ec2-instance-2"
    }
}

#BASTION host to access ec2 instances