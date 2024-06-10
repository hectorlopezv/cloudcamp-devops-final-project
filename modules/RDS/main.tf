resource "aws_db_instance" "default" {
  identifier             = "mydbinstance"
  allocated_storage      = var.db_allocated_storage
  instance_class         = var.db_instance_class
  engine                 = "mysql"
  engine_version         = "8.0"
  db_name                = var.db_name                 # Nombre de la base de datos creada al momento de la creación
  username               = var.db_user                 # Nombre de usuario maestro para la base de datos
  password               = var.db_password             # Contraseña maestra para la base de datos
  parameter_group_name   = "default.mysql8.0"          # Grupo de parámetros para la base de datos
  publicly_accessible    = false                       # La instancia no debe ser accesible públicamente
  vpc_security_group_ids = [var.rds_sg_id]  # Grupos de seguridad asociados a la instancia
  db_subnet_group_name   = aws_db_subnet_group.default.name  # Grupo de subred para la instancia

  tags = {
    Name = "mydbinstance"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "my-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "my-db-subnet-group"
  }
}
