variable "region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
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

variable "vpc_tag" {
    description = "Name of VPC."
    default     = "ExampleVPC"
  
}