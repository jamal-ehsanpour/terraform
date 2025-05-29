# Auto Scaling Group
resource "aws_autoscaling_group" "web_asg" {
  name_prefix          = "${var.project-name}-asg-"
  desired_capacity     = var.instance-count
  max_size             = var.instance-count + 2
  min_size             = var.instance-count
  vpc_zone_identifier = var.private_subnet_ids
  target_group_arns    = [aws_lb_target_group.web_tg.arn]

  launch_template {
    id      = aws_launch_template.web_server.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project-name}-asg"
    propagate_at_launch = true
  }
}