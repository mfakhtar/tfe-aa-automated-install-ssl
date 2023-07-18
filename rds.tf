resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "postgres"
  engine_version         = "12.13"
  instance_class         = var.db_instance_type
  username               = var.db_user
  password               = var.db_password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.tfe_server_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name
}

resource "aws_db_subnet_group" "default" {
  name       = var.unique_name
  subnet_ids = [aws_subnet.guide-tfe-es-sub-db-1a.id, aws_subnet.guide-tfe-es-sub-db-1b.id]

  tags = {
    Name = var.unique_name
  }
}
