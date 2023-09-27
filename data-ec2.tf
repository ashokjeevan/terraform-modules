# Fetch ECS optimised AMI
data "aws_ami" "ecs_linux_ami" {
    most_recent = true

    filter {
        name = "platform-details"
        values = ["Linux*"]
    }

    filter {
        name = "architecture"
        values = ["x86_64"]
    }

    filter {
        name = "name"
        values = ["amzn2-ami-ecs-hvm-*"]
    }

    filter {
        name = "owner-alias"
        values = ["amazon"]
    }
}

data "aws_iam_policy" "ec2_container_service_for_ec2_role_policy" {
    name = "AmazonEC2ContainerServiceforEC2Role"
}

data "aws_iam_policy" "ecs_task_execution_policy" {
    name = "AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy" "ec2_container_service_role_policy" {
    name = "AmazonEC2ContainerServiceRole"
}

data "aws_iam_policy_document" "s3_access_policy" {
    statement {
        actions = [ "s3:ListAllMyBuckets" ]
        resources = [ "arn:aws:s3:::*" ]
        effect = "Allow"
    }
}

data "aws_iam_policy_document" "iam_pass_role_policy_doc" {
    statement {
        actions = [ "iam:PassRole", "iam:ListRoles", "iam:GetRole" ]
        resources = [ "*" ]
        effect = "Allow"
    }
}


data "aws_iam_policy_document" "ec2_iam_assume_role_doc" {
    statement {
        actions = [ "sts:AssumeRole" ]
        principals {
            type = "Service"
            identifiers = [ 
                "ec2.amazonaws.com",
                "ecs.amazonaws.com",
                "ecs-tasks.amazonaws.com" 
            ]
        }
    }
}
