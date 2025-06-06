
# # VPC Creation

# resource "aws_vpc" "example_vpc" {
#   cidr_block = "10.0.0.0/16"
# }

# # Subnets

# resource "aws_subnet" "public_subnet" {
#   vpc_id            = aws_vpc.example_vpc.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "${var.region}a"
# }

# resource "aws_subnet" "private_subnet" {
#   vpc_id            = aws_vpc.example_vpc.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-1b"
# }

# # Internet Gateway

# resource "aws_internet_gateway" "example_igw" {
#   vpc_id = aws_vpc.example_vpc.id
# }

# # Route Table association

# resource "aws_route_table" "public_route_table" {
#   vpc_id = aws_vpc.example_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.example_igw.id
#   }
# }

# resource "aws_route_table_association" "public_subnet_association" {
#   subnet_id      = aws_subnet.public_subnet.id
#   route_table_id = aws_route_table.public_route_table.id
# }


# Instance Configuration
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  # availability_zone = aws_subnet.public_subnet.id
  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "example" {
  name        = var.security_group_name
  description = "Allow inbound traffic on port 22 and 80"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
