output "db_endpoint" {
  value = aws_db_instance.app_db.endpoint
}

output "db_sg_id" {
  value = aws_security_group.rds_sg.id
}