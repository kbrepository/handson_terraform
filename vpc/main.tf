# VPC Configuration

resource "aws_vpc" "ExampleVPC" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_tag
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.ExampleVPC.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.ExampleVPC.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "${var.region}b"
}

# Internet Gateway

resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.ExampleVPC.id
}

# Route Table association

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.ExampleVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example_igw.id
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
