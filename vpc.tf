# Create a VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet within the VPC
resource "aws_subnet" "example_subnet" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"
}

# Create an internet gateway for the VPC
resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id
}

# Attach the internet gateway to the VPC
resource "aws_vpc_attachment" "example_attachment" {
  vpc_id             = aws_vpc.example_vpc.id
  internet_gateway_id = aws_internet_gateway.example_igw.id
}
