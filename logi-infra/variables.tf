variable "project_id" {
  type = string
}
variable "region" {
  type = string
  default = "us-central1"
}
variable "zone" {
  type = string
  default = "us-central1-a"
}
variable "vpc_name" {
  type = string
  default = "logistics-vpc"
}
variable "subnet_name" {
  type = string
  default = "logistics-subnet"
}
variable "subnet_cidr" {
  type = string
  default = "10.10.0.0/16"
}
variable "cluster_name" {
  type = string
  default = "logistics-cluster"
}
variable "db_instance_name" {
  default = "logistics-db"
}
variable "db_user" {
  default = "admin"
}
variable "db_password" {
    type = string
    default = "logi@123" 
}
variable "db_version" {
  type = string
  default = "POSTGRES_14"
}
variable "db_tier" {
  type = string
  default = "df_f1_micro"
}