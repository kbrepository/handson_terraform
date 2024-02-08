variable "region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID"
  default     = "ami-0a3c3a20c09d6f377"
}

variable "instance_type" {
  description = "Instance type of EC2 instance."
  default     = "t2.micro" 
}

variable "instance_name" {
  description = "Name of Instance."
  default     = "ExampleInstance"
}

variable "security_group_name" {
  description = "Name of Security Group"
  default     = "example-security-group"
}

variable "vpc_cidr" {
    description = "CIDR of VPC"
    default     = "10.0.0.0/20"
}

variable "public_subnet_cidr" {
    description = "CIDR of VPC"
    default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR of VPC"
    default     = "10.0.2.0/24"
}