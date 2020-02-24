
resource "null_resource" "db_setup" {
  # runs after rds is provisioned
  depends_on = [aws_db_instance.dadu_postgres]

  provisioner "local-exec" {
    command = "psql -h ${aws_db_instance.dadu_postgres.address} -p 5432 -U \"${var.username}\" -f \"restore.sql\""
    environment = {
      PGPASSWORD = var.password
    }
  }
}

resource "null_resource" "db_restore" {
  #runs after database dvdrental is created
  depends_on = [
    null_resource.db_setup]
  provisioner "local-exec" {
    command = "pg_restore -h ${aws_db_instance.dadu_postgres.address} -U postgres -d dvdrental dvdrental.tar"
    environment = {
      PGPASSWORD = var.password
    }
  }
}