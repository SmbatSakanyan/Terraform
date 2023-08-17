resource "aws_ecr_repository" "week4_ecr" {
  name = "week4_ecr"
  image_scanning_configuration {
    scan_on_push = true
  }
}
