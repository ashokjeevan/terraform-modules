output "rds_endpoint" {
  value = aws_db_instance.rds_db.endpoint
}

output "rds_username" {
  value = aws_db_instance.rds_db.username
}