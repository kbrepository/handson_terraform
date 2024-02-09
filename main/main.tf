provider "aws" {
  region = var.region
  profile = "awskb"
}

module "vpc"{
  source              = "../vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "ec2_instance" {
  source              = "../ec2-instance"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  instance_name       = var.instance_name
  security_group_name = var.security_group_name
}
