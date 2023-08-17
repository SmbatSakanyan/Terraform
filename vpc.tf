resource "aws_vpc" "week4_VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "week4_VPC"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.week4_VPC.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-west-2a"

}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.week4_VPC.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2b"
}

resource "aws_internet_gateway" "week4_IGW" {
  vpc_id = aws_vpc.week4_VPC.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.week4_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.week4_IGW.id
  }
}

resource "aws_route_table_association" "public_a" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_a.id
}

resource "aws_route_table_association" "public_b" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_b.id
}
