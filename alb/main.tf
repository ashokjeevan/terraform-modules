resource "aws_lb" "load_balancer" {
  name                             = var.alb_name
  internal                         = var.is_internal
  load_balancer_type               = var.load_balancer_type
  security_groups                  = [var.alb_security_group_id]
  subnets                          = var.alb_subnets
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  idle_timeout                     = var.idle_timeout_seconds

  tags = {
    Name = var.alb_name
  }
}