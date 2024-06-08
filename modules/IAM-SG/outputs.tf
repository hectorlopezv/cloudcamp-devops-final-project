output "rds_security_group_id" {
    value = aws_security_group.rds_sg.id
}

output "ec2_security_group_id" {
    value = aws_security_group.ec2_sg.id
}

output "efs_security_group_id" {
  value = aws_security_group.efs_sg.id
}