resource "aws_ecs_cluster" "my_cluster" {
    name = var.ecs_cluster_name

    setting {
      name = "containerInsights"
      value = "enabled"
    }
}


# resource "aws_ecs_capacity_provider" "ecs_capacity_provider" {
#     name = "ecs_capacity_provider"

#     auto_scaling_group_provider {
#         # TODO
#       auto_scaling_group_arn = <ASG ARN>
#       managed_termination_protection = "ENABLED"
    

#         managed_scaling {
#             maximum_scaling_step_size = 10
#             minimum_scaling_step_size = 1
#             status = "ENABLED"
#             target_capacity = 80
#         }
#     }
# }

# resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_capacity_providers" {
#     cluster_name = aws_ecs_cluster.my_cluster.id
#     capacity_providers = [ aws_ecs_capacity_provider.ecs_capacity_provider.name ]

#     default_capacity_provider_strategy {
#       base = 1
#       weight = 100

#       capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name
#     }
# }