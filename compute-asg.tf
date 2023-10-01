resource "aws_launch_template" "this_launch_template" {
    name = var.launch_template_name

    block_device_mappings {
        device_name = "/dev/xvda"

        ebs {
            delete_on_termination = true
            encrypted = true
            volume_type = "gp2"
        }
    }

    iam_instance_profile {
      name = aws_iam_instance_profile.ec2_instance_profile.name
    }

    instance_type = "t2.micro"
    key_name = "ansiblkeypair2023"

    tag_specifications {
      resource_type = "instance"
      tags = { Name = "dev_ec2_instance" }
    }

    tag_specifications {
      resource_type = "volume"
      tags = { Name = "dev_ec2_volume" }
    }

    tag_specifications {
      resource_type = "network-interface"
      tags = { Name = "dev_ec2_network_interface" }
    }

    image_id = data.aws_ami.ecs_linux_ami.id

    user_data = data.cloudinit_config.config.rendered
}

resource "aws_autoscaling_group" "this_asg" {
  name = "ecs-asg"
  min_size = 1
  desired_capacity = 1
  max_size = 3

  launch_template {
    id = aws_launch_template.this_launch_template.id
    version = "$Latest"
  }
  availability_zones = [ "ca-central-1a","ca-central-1b", "ca-central-1d" ]
  health_check_type = "EC2"
  tag {
    key = "AmazonECSManaged"
    value = true
    propagate_at_launch = true
  }
}