resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "my-db-subnet-group"
  }
}

resource "aws_db_instance" "rds_instance" {
  identifier             = "mydbinstance"
  allocated_storage      = "20"
  instance_class         = "db.t3.micro"
  engine                 = "mysql"
  engine_version         = "8.0"
  db_name                = "myinstancerds"                      # Database name created at the moment of creation
  username               = "admin"                            # Master username for the database
  password               = "admin123456"                              # Master password for the database
  parameter_group_name   = "default.mysql8.0"                   # Parameter group for the database
  publicly_accessible    = false                                # The instance should not be publicly accessible
  vpc_security_group_ids = [var.rds_sg_id]                      # Security groups associated with the instance
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name # Subnet group for the instance
  skip_final_snapshot    = true
  tags = {
    Name = "mydbinstance"
  }
}
