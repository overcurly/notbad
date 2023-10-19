####################################################
# Target Group Creation
####################################################

resource "aws_lb_target_group" "tg" {
  name        = "NotBadTargetGroup"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.notbad_vpc.id
}

####################################################
# Target Group Attachment with Instance
####################################################

resource "aws_alb_target_group_attachment" "tgattachment" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.instance.id
}

####################################################
# Application Load balancer
####################################################

resource "aws_lb" "lb" {
  name               = "NotBadALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id, ]
  subnets            = aws_subnet.public_subnet.*.id
}

####################################################
# Listener
####################################################

resource "aws_lb_listener" "notbad" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "8089"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}