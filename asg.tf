resource "aws_autoscaling_group" "ASG" {
  name                 = "ASG"
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1
  depends_on           = [aws_lb.ALB]
  target_group_arns    = ["${aws_lb_target_group.TG.arn}"]
  health_check_type    = "EC2"
  launch_configuration = aws_launch_configuration.webserver-launch-config.name
  vpc_zone_identifier  = ["${aws_subnet.public_a.id}", "${aws_subnet.public_b.id}"]

}

# Create Target group

resource "aws_lb_target_group" "TG" {
  name       = "TG"
  depends_on = [aws_vpc.week4_VPC]
  port       = 3000
  protocol   = "HTTP"
  vpc_id     = aws_vpc.week4_VPC.id
  health_check {
    interval            = 70
    path                = "/login"
    port                = 80
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 60
    protocol            = "HTTP"
    matcher             = "200"
  }
}
