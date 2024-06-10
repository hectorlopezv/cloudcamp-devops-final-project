output "rds_security_group_id" {
  value = aws_security_group.rds_sg.id
}

output "ec2_security_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "efs_security_group_id" {
  value = aws_security_group.efs_sg.id
}

output "bastion_security_group_id" {
  value = aws_security_group.bastion_sg.id
}
output "lb_sg_id" {
  value = aws_security_group.lb_sg.id

}