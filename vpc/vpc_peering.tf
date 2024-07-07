resource "aws_vpc_peering_connection" "peering_connection" {
    count = var.vpc_peering_enabled ? 1 : 0
  peer_owner_id = var.aws_account_id # data.aws_caller_identity.current.id # target peer VPC owner id
  peer_vpc_id   = var.target_vpc_id # module.vpc_a.vpc_id                 # target peer VPC id
  vpc_id        = var.requestor_vpc_id #module.vpc_b.vpc_id                 # requestor VPC id
  auto_accept   = var.peering_connection_auto_accept
}
