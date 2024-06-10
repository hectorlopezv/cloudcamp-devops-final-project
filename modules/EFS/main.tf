resource "aws_efs_file_system" "efs" {
  creation_token = "my-efs-cloudcamp-final-project"
  tags = {
    Name = "my-efs-cloudcamp-final-project"
  }
}

#mount target
resource "aws_efs_mount_target" "efs_mount_target" {
 for_each           = { for idx, subnet_id in var.private_subnet_ids : idx => subnet_id }
  file_system_id     = aws_efs_file_system.efs.id
  subnet_id          = each.value
  security_groups    = [var.efs_sg_id]
}

