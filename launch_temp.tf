resource "aws_launch_configuration" "webserver-launch-config" {
  name_prefix                 = "webserver-launch-config"
  image_id                    = var.ami
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.EC2_profile.name
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.week4_SG.id]


  lifecycle {
    create_before_destroy = true
  }
  user_data = file("user-data-pull.sh")
}
