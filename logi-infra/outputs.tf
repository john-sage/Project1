/* This file is used to show or export useful information from the resources we’ve created*/

# ===== GKE (Google Kubernetes Engine) Outputs =====

# Name of the GKE cluster
output "gke_cluster_name" {
  value = google_container_cluster.primary.name
}

# Endpoint (API server URL) to access the GKE cluster
output "gke_endpoint" {
  value = google_container_cluster.primary.endpoint
}

# Service account associated with the default node pool in GKE
output "gke_default_sa" {
  value = google_container_node_pool.primary_nodes.node_config[0].service_account
}

# ===== Networking Outputs =====

# Self-link (unique identifier) of the subnet used for networking
output "subnet_self_link" {
  value = google_compute_subnetwork.subnet.self_link
}

# ===== Cloud SQL Outputs =====

# Connection name used to connect to the Cloud SQL instance
output "db_instance_connection_name" {
  value = google_sql_database_instance.default.connection_name
}

# Private IP address of the Cloud SQL instance
output "db_private_ip" {
  value = google_sql_database_instance.default.private_ip_address
}

# ===== Google Cloud Storage Outputs =====

# URL of the GCS bucket in "gs://" format
output "gcs_bucket_url" {
  value = "gs://${google_storage_bucket.logi_app_bucket.name}"
}

# ===== Pub/Sub Outputs =====

# Name of the Pub/Sub topic used for messaging
output "pubsub_topic_name" {
  value = google_pubsub_topic.shipment_topic.name
}