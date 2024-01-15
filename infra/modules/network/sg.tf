#=====================Security Group====================
resource "aws_security_group" "sg_elb" {
  name   = "elb-sg"
  vpc_id = module.vpc.vpc_id
  
  ingress {
    protocol         = "tcp"
    from_port        = 80
    to_port          = 80
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  depends_on = [ module.vpc ]

}

resource "aws_security_group" "sg_ec2" {
  name   = "ec2-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 80
    to_port         = 80
    security_groups = [aws_security_group.sg_elb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [ aws_security_group.sg_elb ]

}