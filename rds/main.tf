resource "aws_db_subnet_group" "rds_subnet_grp" {
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "rds_db" {
  allocated_storage      = var.allocated_storage
  engine                 = var.rds_engine        
  engine_version         = var.rds_engine_version
  instance_class         = var.rds_instance_class
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_grp.id
  vpc_security_group_ids = var.vpc_security_group_ids
  db_name                = var.rds_db_name
  username               = var.rds_db_username
  password               = var.rds_db_password
  skip_final_snapshot    = var.skip_final_snapshot

  tags = {
    Name = var.rds_db_name
  }

  lifecycle {
    ignore_changes = [password]
  }
}