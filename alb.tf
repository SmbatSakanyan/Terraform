resource "aws_lb" "ALB" {
  name               = "ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.week4_SG.id]
  subnets            = [aws_subnet.public_a.id, aws_subnet.public_b.id]

}

# Create ALB Listener 

resource "aws_lb_listener" "ALB_listener" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.TG.arn
  }
}
