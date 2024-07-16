variable "launch_template_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "ami_id" {
  type = string
}

variable "user_data" {
  type = any
}

variable "asg_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "desired_capacity" {
  type    = number
  default = 3
}

variable "min_size" {
  type    = number
  default = 3
}

variable "max_size" {
  type    = number
  default = 3
}

variable "target_group_arns" {
  type = list(string)
}