variable "ecs_cluster_name" {
    type = string
    description = "ECS cluster name"

    default = "ecs-test-cluster"
}

variable "ecs_log_group" {
    type = string
    description = "Log group for the ECS cluster"

    default = "ecs_log_group"
}

variable "launch_template_name" {
    type = string
    description = "Launch template name"

    default = "test_launch_template"
}