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
  db_name                = "myinstancerds"                      # Nombre de la base de datos creada al momento de la creación
  username               = "admin"                      # Nombre de usuario maestro para la base de datos
  password               = "db-password"                  # Contraseña maestra para la base de datos
  parameter_group_name   = "default.mysql8.0"               # Grupo de parámetros para la base de datos
  publicly_accessible    = false                            # La instancia no debe ser accesible públicamente
  vpc_security_group_ids = [var.rds_sg_id]                  # Grupos de seguridad asociados a la instancia
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name # Grupo de subred para la instancia

  tags = {
    Name = "mydbinstance"
  }
}

