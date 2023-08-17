resource "aws_instance" "Ec2_for_Ecr" {
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.week4_SG.id]
  subnet_id                   = aws_subnet.public_a.id
  iam_instance_profile        = aws_iam_instance_profile.EC2_profile.name
  ami                         = var.ami
  instance_type               = var.instance_type
  user_data                   = file("user-data.sh")
}
