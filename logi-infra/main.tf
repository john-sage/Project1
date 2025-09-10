provider "google" {
    project = var.project_id
    region = var.region
    zone = var.zone
}
resource "google_compute_network" "vpc_network" {
    name = var.vpc_name
    auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "subnet" {
    name = var.subnet_name
    ip_cidr_range = var.subnet_cidr
    region = var.region
    network = google_compute_network.vpc_network
}
resource "google_container_cluster" "primary_cluster" {
  name = var.cluster_name
  location = var.zone
  remove_default_node_pool = true
  initial_node_count = 1
  network = google_compute_network.vpc_network.id
  subnetwork = google_compute_subnetwork.subnet.name
  ip_allocation_policy {}
}
resource "google_container_node_pool" "primary_nodes" {
  name = "default-node-pool"
  cluster = google_container_cluster.primary_cluster.name
  location = var.zone
  node_config {
    machine_type = "ec2-medium"
    oauth_scopes = [ "https://www.googleapis.com/auth/cloud-platform", ]
  }
  initial_node_count = 2
}
resource "google_sql_database_instance" "default" {
  name = var.db_instance_name
  database_version = var.db_version
  region = var.zone
  settings {
    tier = var.db_tier
    ip_configuration {
      ipv4_enabled = false
      private_network = "project/${var.project_id}/global/networks/${var.vpc_name}"
    }
  }
  deletion_protection = false
}
resource "google_sql_user" "users" {
  name = var.db_user
  instance = google_sql_database_instance.default.name
  password = var.db_password
}
resource "google_sql_database" "logistics_db" {
  name = "logistics"
  instance = google_sql_database_instance.default.name
}
resource "google_storage_bucket" "logi_app_bucket" {
  name = "${var.project_id}-logistics_assets"
  location = var.zone
  force_destroy = true
  uniform_bucket_level_access = true
}
resource "google_pubsub_topic" "shipment_topic" {
  name = "shipment-created"
}
resource "google_project_iam_binding" "gke_sql_access" {
  project = var.project_id
  role = "roles/cloudsql.client"
  members = [ "serviceAccount : ${var.gke_sa_email}" ]
}