# Terraform

Here we have 2 steps of building infrastructure 
1. Creating ec2 instance to clone application source code , dockerize and push docker image to ECR

2. Setting up Auto scaling group and Application load balancer 


To test this project you have to 

1. Set up aws credantials 

2. Run following commands

terraform init
terraform plan 
terraform apply 

After creating resources you will get ALB DNS name 

check <<ALB DNS NAME>>/login in 5-6 minutes after creation


