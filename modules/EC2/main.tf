resource "aws_instance" "aws_app_server_1" {
      ami = "ami-0bb84b8ffd87024d8"
    instance_type = var.instance_type
    availability_zone = var.availability_zone

    tags = {
      Name = "cloudcamp-final-project-ec2-instance-1"
    }
}

resource "aws_instance" "aws_app_server_2" {
      ami = "ami-0bb84b8ffd87024d8"
    instance_type = var.instance_type
    availability_zone = var.availability_zone

    tags = {
      Name = "cloudcamp-final-project-ec2-instance-2"
    }
}