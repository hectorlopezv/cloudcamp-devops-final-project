output "hello" {
  value = "Hello, World!"
}

output "bastion_private_key" {
  value =  module.EC2_INSTANCES_APP_SERVER.bastion_private_key
  sensitive = true
}

output "aws_app_server_1_key" {
  value = module.EC2_INSTANCES_APP_SERVER.aws_app_server_1_key.private_key_pem
  sensitive = true
}
output "aws_app_server_2_key" {
  value = module.EC2_INSTANCES_APP_SERVER.aws_app_server_2_key.private_key_pem
  sensitive = true
}