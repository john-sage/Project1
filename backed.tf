terraform {
  backend "s3"{
    bucket                 = "john-bucket12345"
    region                 = "eu-north-1"
    key                    = "backend.tfstate"
  }
}