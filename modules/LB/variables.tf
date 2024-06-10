variable "vpc_id" {
  description = "the id of the vpc"
  type = string
}
variable "pub_sub1_id" {
  description = "the id of the public subnet 1"
  type = string
}

variable "pub_sub2_id" {
  description = "the id of the public subnet 2"
  type = string
}

variable "app_server_1_id" {
  description = "the id of the app server 1"
  type = string
  
}

variable "app_server_2_id" {
  description = "the id of the app server 2"
  type = string
}
variable "lb_sg_id" {
  description = "the security group id for the load balancer"
  type = string
}