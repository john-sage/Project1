# This below code creates S3 bucket  using terraform template

provider "aws" {
  region = "eu-north-1"
}
resource "aws_s3_bucket" "my_bucket" {
  bucket  = "bucket_with_terraform12345"
}
  