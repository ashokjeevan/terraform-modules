resource "aws_ecs_cluster" "my_cluster" {
    name = var.ecs_cluster_name

    setting {
      name = "containerInsights"
      value = "enabled"
    }
}


resource "aws_ecs_capacity_provider" "ecs_capacity_provider" {
    name = "first_capacity_provider" # cannot be specified starting with prefix 'aws', 'ecs' or 'fargate'

    auto_scaling_group_provider {
      auto_scaling_group_arn = aws_autoscaling_group.this_asg.arn
      managed_termination_protection = "DISABLED"
    

        managed_scaling {
            maximum_scaling_step_size = 10
            minimum_scaling_step_size = 1
            status = "ENABLED"
            target_capacity = 90
        }
    }
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_capacity_providers" {
    cluster_name = aws_ecs_cluster.my_cluster.id
    capacity_providers = [ aws_ecs_capacity_provider.ecs_capacity_provider.name ]

    default_capacity_provider_strategy {
      base = 1
      weight = 1

      capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name
    }

    lifecycle {
      ignore_changes = [ cluster_name ]
    }
}

# task def
resource "aws_ecs_task_definition" "task_def" {
  # required
  family = "task_def_nginx"
  container_definitions = jsonencode([
    {
      name = "nginx-container"
      image = "752200948877.dkr.ecr.ca-central-1.amazonaws.com/testrepo:latest"

      portMappings = [
        {
          containerPort = 80
          hostPort = 0
          protocol = "tcp"
        }
      ]

      memory = 374
    }
  ])
  
  # optional
  execution_role_arn = aws_iam_role.ec2_iam_role.arn
}

# ecs service
resource "aws_ecs_service" "ecs_service" {
  name = "nginx-service"
  cluster = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.task_def.arn
  desired_count = 15
  launch_type = "EC2" # defaults to EC2
}