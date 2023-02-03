provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
        Owner = "KB"
    }
    
  }
}

//how to create vpc?
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "My-VPC"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/26"
  tags = {
    Name = "My-Subnet"
  }
}


//how to validate .tf file? 