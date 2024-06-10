#ALB target group
resource "aws_lb_target_group" "tg" {
  name     = "ec2-targets"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "cloducamp-final-project-ec2-target-group"
  }
}

##ALB

resource "aws_alb" "alb" {
  name               = "cloudcamp-final-project-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_sg_id]
  subnets            = [var.pub_sub1_id, var.pub_sub2_id] ## need to be accessible hence why we are using public subnets

  tags = {
    Name = "cloudcamp-final-project-alb"
  }
}

#ALB listener

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}


#Register the ec2 instances to the target group

resource "aws_lb_target_group_attachment" "tg_attachment_1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.app_server_1_id
  port             = 5000
}


resource "aws_lb_target_group_attachment" "tg_attachment_2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.app_server_2_id
  port             = 5000
}