# Project1
This is the new project used for understanding the concept of branching in Git, using Terraform for infrastructure creation, and team work. 
When we run 'terraform init', 'terraform plan', 'terraform apply' commands, **terraform.tfstate** file is automatically created. This file is nothing but the memory of Terraform which keeps track of the real infra it has created.
    With it, Terraform knows what it has already created, changed, or needs to destroy.
Then comes the **backend.tf** file through which we tell Terraform where to store the state file, instead of keeping it locally. 
    Since our backend.tf points to a remote backend like a GCS/S3 bucket, that bucket must already exist before we initialize Terraform. S3.tf file creates an S3 bucket for this purpose.
**How are we going to automate this provisioning using CI-CD (GitHub Actions)?**
Create a separate .yaml file with terraform job. In this we must securely **authenticate** to GCP/AWS, so Terraform can create or manage resources.
    In GCP --> IAM --> Service Accounts --> create a SA, then a Key and download the JSON file which we use to authenticate. Store this is GitHub Secrets and call it in the .yaml file.
    In AWS, we create Access Key ID and Secret Access Key, store in secrets and call it.
Check jenkins-provisioning pipeline script to understand how can we automate using **Jenkins**
