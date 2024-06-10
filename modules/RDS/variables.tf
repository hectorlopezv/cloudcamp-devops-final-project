variable "db_user" {
  description = "The username for the RDS instance."
  type        = string
}

variable "db_password" {
  description = "The password for the RDS instance."
  type        = string
}

variable "db_name" {
  description = "The name of the initial database created when the RDS instance is created."
  type        = string
}

variable "db_instance_class" {
  description = "The instance class of the RDS instance."
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS instance."
  type        = number
  default     = 20
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the RDS instance."
  type        = list(string)
}

variable "ec2_sg_id" {
  description = "The security group ID for the EC2 instances."
  type        = string
}
variable "db_port" {
  description = "The port for the RDS instance."
  type        = string
  default     = "3306"
}
variable "rds_sg_id" {
  description = "The security group for the RDS instance."
  type        = string

}