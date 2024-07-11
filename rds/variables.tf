variable "allocated_storage" {
  type = number
}

variable "rds_engine" {
  type = string
}

variable "rds_engine_version" {
  type = string
}

variable "rds_instance_class" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "rds_db_name" {
  type = string
}

variable "rds_db_username" {
  type = string
}

variable "rds_db_password" {
  type = string
}

variable "skip_final_snapshot" {
  type    = bool
  default = true
}

variable "private_subnet_ids" {
  type = list(string)
}