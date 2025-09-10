terraform {
  backend "s3"{
    bucket                 = "john-bucket12345"
    region                 = "eu-north-1"
    key                    = "backend.tfstate" #The file path/name where Terraform will store its state file in the bucket
  }
}
