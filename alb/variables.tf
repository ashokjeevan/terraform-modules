variable "alb_name" {
  type = string
}

variable "is_internal" {
  type    = bool
  default = false
}

variable "load_balancer_type" {
  type    = string
  default = "application"
}

variable "alb_security_group_id" {
  type = string
}

variable "alb_subnets" {
  type = list(string)
}

variable "enable_cross_zone_load_balancing" {
  type    = bool
  default = true
}

variable "idle_timeout_seconds" {
  type    = number
  default = 60
}