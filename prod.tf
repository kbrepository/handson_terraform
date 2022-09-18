provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

resource "aws_s3_bucket" "tf_bucket" {
  bucket = "tf-bucket-kb"
  acl = "private"
}

resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "prod_web" {
  name        = "prod_web"
  description = "Allow standard HTTP and HTTPS ports inbound and everything outbound"
  
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
  
}