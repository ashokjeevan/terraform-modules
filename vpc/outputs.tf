output "vpc_id" {
  value = aws_vpc.vpc.id
  description = "VPC Id"
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets.*.id
  description = "Public subnet Ids"
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnets.*.id
  description = "Private subnet Ids"
}

output "private_rds_subnet_ids" {
  value = var.private_rds_subnet_cidrs != null ? aws_subnet.private_rds_subnets.*.id : null
  description = "Private RDS subnet Ids - if created"
}

output "default_route_table_id" {
  value = aws_vpc.vpc.main_route_table_id
  description = "Main route table Id - associated with private subnets (for the time being)"
}

output "public_route_table_id" {
  value = var.public_subnet_cidrs != null ? aws_route_table.public_route_table : null
  description = "Public route table Id - associated with public subnets (attached to internet gateway) - if created"
}

output "vpc_cidr_block" {
  value = aws_vpc.vpc.cidr_block
  description = "VPC CIDR block"
}