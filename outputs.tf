output "hello" {
  value = "Hello, World!"
}

output "bastion_private_key" {
  value =  module.EC2_INSTANCES_APP_SERVER.bastion_private_key
  sensitive = true
}

output "aws_app_server_1_private_key" {
  value = module.EC2_INSTANCES_APP_SERVER.aws_app_server_1_key
  sensitive = true
}
output "aws_app_server_2_private_key" {
  value = module.EC2_INSTANCES_APP_SERVER.aws_app_server_2_key
  sensitive = true
}