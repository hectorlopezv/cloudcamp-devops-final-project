variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "private_subnet_ids" {
  description = "A list of private subnet IDs for the EFS mount targets."
  type        = list(string)
}

variable "efs_security_group_id" {
  description = "The security group ID for the EFS."
  type        = string
}
