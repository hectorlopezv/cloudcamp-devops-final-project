output "AWS_APP_SERVER_1_ID" {
  value = aws_instance.aws_app_server_1.id
}
output "AWS_APP_SERVER_2_ID" {
  value = aws_instance.aws_app_server_2.id
}
output "bastion_private_key" {
  value = tls_private_key.bastion_key.private_key_pem
  sensitive = true
}
output "aws_app_server_1_key" {
  value = tls_private_key.aws_app_server_1_key.private_key_pem
  sensitive = true
}
output "aws_app_server_1_key" {
  value = tls_private_key.aws_app_server_2_key.private_key_pem
  sensitive = true
}