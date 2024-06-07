
resource "aws_db_instance" "default" {
  identifier = "rds_db_cloud_camp_final_project"
  allocated_storage = var.db_allocated_storage
  instance_class = var.db_instance_class
  engine = "mysql"
  engine_version = "8.0"
  db_name = var.db_name
  username = var.db_user
  password = var.db_password
  parameter_group_name = "default.mysql8.0"  
}