#===============ELB=====================================

resource "aws_lb" "ag_lb" {
  name               = "app-elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_elb.id]
  subnets            = module.vpc.public_subnets
  depends_on         = [aws_security_group.sg_elb]
}

resource "aws_lb_target_group" "alb_tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  depends_on = [ aws_lb.ag_lb ]
}

resource "aws_lb_listener" "sh_front_end" {
  load_balancer_arn = aws_lb.ag_lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
  depends_on = [ aws_lb_target_group.alb_tg ]
}