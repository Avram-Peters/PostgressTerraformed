

resource "aws_db_instance" "dadu_postgres" {
  skip_final_snapshot = true
  allocated_storage = 20
  storage_type = "gp2"
  engine = "postgres"
  engine_version = "11.5"
  instance_class = "db.t2.small"
  name = "postgres"
  username = var.username
  password = var.password
  parameter_group_name = "default.postgres11"
  vpc_security_group_ids = [aws_security_group.dadu-rds.id]
  publicly_accessible = true
  identifier = var.db_identifier
  tags = local.common_tags

}

