output "vpc_peering_connection_id" {
    value = aws_vpc_peering_connection.peering_connection.id
}

output "peering_connection_accept_status" {
    value = aws_vpc_peering_connection.peering_connection.accept_status
}