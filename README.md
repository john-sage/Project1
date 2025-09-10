# Project1
This is the new project used for understanding the concept of branching in Git, using Terraform for infrastructure creation, and team work. 
When we run 'terraform init', 'terraform plan', 'terraform apply' commands, **terraform.tfstate** file is automatically created. This file is nothing but the memory of Terraform which keeps track of the real infra it has created.
    With it, Terraform knows what it has already created, changed, or needs to destroy.
Then comes the **backend.tf** file through which we tell Terraform where to store the state file, instead of keeping it locally. 
    Since our backend.tf points to a remote backend like a GCS/S3 bucket, that bucket must already exist before we initialize Terraform. S3.tf file creates an S3 bucket for this purpose.
