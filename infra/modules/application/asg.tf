resource "aws_autoscaling_group" "app_asg" {
  desired_capacity = 1
  max_size         = 1
  min_size         = 1

  target_group_arns = [var.target_group_arn]

  vpc_zone_identifier = var.private_subnet_ids

  launch_template {
    id      = aws_launch_template.asg_ec2_lt.id
    version = "$Latest"
  }
}