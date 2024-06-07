variable "db_user" {
  description = "The username for the RDS instance."
  type        = string
}

variable "db_password" {
  description = "The password for the RDS instance."
  type        = string
}

variable "db_name" {
  description = "The name of the database to create."
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
