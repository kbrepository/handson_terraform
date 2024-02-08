provider "aws" {
	region = "ap-south-1"

    default_tags {
    tags = {
        Owner           = "Test2"
        # Workstream      = "Infra"
        # Cost            = "Tentative"
        # Purpose         = "Test"
        # Environment     = "Nonprod"
        # Launch-Date     = "Now"
    }
}
}

resource "aws_security_group" "prod_web" {
  name        = "prod_web"
  description = "Allow standard HTTP and HTTPS ports inbound and everything outbound"
  
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
  ingress {
    from_port   = 443
    to_port     = 443
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

// how to get latest amazon linux2 ami?

# ?? This is test



data "aws_ami" "latest" {
  # executable_users = ["self"]
  most_recent      = true
  # name_regex       = "^myami-\\d{3}"
  # owners           = ["self"]

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "my-instance" {
  count         = 1
	
  ami           = data.aws_ami.latest.id
	instance_type = "t2.micro"
  key_name      = "test-aws.pem"
	user_data     = "${file("install_apache.sh")}" 

  vpc_security_group_ids = [aws_security_group.prod_web.id] 

}

