variable "vpc_peering_enabled" { 
  type = bool
  default = false
}

variable "aws_account_id" {
  type = number
  default = null
}

variable "target_vpc_id" {
  type = string
  default = null
}

variable "requestor_vpc_id" {
  type = string
  default = null
}

variable "peering_connection_auto_accept" {
  type = bool
  default = false
}