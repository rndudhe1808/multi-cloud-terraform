provider "aws" {
  region = "us-east-1"
  access_key = "AKIAQ*******************"
  secret_key = "QcjOz2rXhQtO************"  
}

# Create VPC
resource "aws_vpc" "example_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "example_vpc"
  }  
}

# Create Subnet within VPC
resource "aws_subnet" "example_subnet" {
  vpc_id                  = aws_vpc.example_vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  
  tags = {
    Name = "example_subnet"
  }
}

# Create EC2 Instance in the Subnet
resource "aws_instance" "ec2_instance" {
  ami           = "ami-0277155c3f0ab2930"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example_subnet.id

  tags = {
    Name = "terraform-instance"
  }
}
