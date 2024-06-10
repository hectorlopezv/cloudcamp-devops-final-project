variable "instance_type" {
    description = "The type of instance to launch"
    type = string
}
variable "availability_zone" {
    description = "The availability zone to launch the instance in"
    type = string 
}
variable "efs_id" {
  description = "The ID of the EFS file system."
  type        = string
}
variable "ec2_sg_id" {
  description = "The security group ID for the EC2 instance."
  type        = string
}

variable "subnet_id_1" {
  description = "The subnet ID for the EC2 instance."
  type        = string
}
variable "subnet_id_2" {
  description = "The subnet ID for the EC2 instance."
  type        = string
}


variable "bastion_ami_id" {
  description = "The AMI ID for the bastion host."
  type        = string
}

variable "bastion_instance_type" {
  description = "The instance type for the bastion host."
  type        = string
  default     = "t2.micro"
}

variable "bastion_key_name" {
  description = "The name of the key pair to use for the bastion host."
  type        = string
}

variable "public_subnet_id" {
  description = "The subnet ID for the bastion host."
  type        = string
}

