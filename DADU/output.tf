output "rds-address" {
  value = aws_db_instance.dadu_postgres.address
}

output "rds-port" {
  value = aws_db_instance.dadu_postgres.port
}

output "username" {
  value = var.username
}

output "password" {
  value = var.password
}
