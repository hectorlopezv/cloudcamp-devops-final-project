#!/bin/bash
sudo dnf update -y
sudo dnf install -y amazon-efs-utils

# Crear la carpeta del código de la aplicación y la carpeta env
sudo mkdir -p /home/ec2-user/app/env
sudo chown -R ec2-user:ec2-user /home/ec2-user/app

# Montar el sistema de archivos EFS
sudo mount -t efs ${efs_id}:/ /home/ec2-user/app/env

# Asegurar que el montaje persista después de reiniciar
echo "${efs_id}:/ /home/ec2-user/app/env efs defaults,_netdev 0 0" | sudo tee -a /etc/fstab

# Instalar Python 3 y Git
sudo dnf install -y python3 git
