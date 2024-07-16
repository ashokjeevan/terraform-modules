resource "aws_launch_template" "launch_template" {
  name_prefix            = var.launch_template_name
  image_id               = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_groups
  user_data = var.user_data
  tags = {
    Name = var.launch_template_name
  }
}

resource "aws_autoscaling_group" "wordpress_asg" {
  name                = var.asg_name
  vpc_zone_identifier = var.subnet_ids
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size
  launch_template {
    id      = aws_launch_template.launch_template.id
    version = aws_launch_template.launch_template.latest_version
  }
  target_group_arns = var.target_group_arns
}