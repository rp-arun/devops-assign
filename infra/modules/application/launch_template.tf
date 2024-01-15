resource "aws_launch_template" "asg_ec2_lt" {
  name_prefix   = "asg-ec2-lt"
  instance_type = "t2.micro"
  image_id      = "ami-0944e91aed79c721c"
  user_data     = filebase64("${path.module}/user_data.sh")

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.sg_ec2_id]
  }

}