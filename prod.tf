provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

resource "aws_s3_bucket" "tf_bucket" {
  bucket = "tf-bucket-kb"
  acl = "private"
}