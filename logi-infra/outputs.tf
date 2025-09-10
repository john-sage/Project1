output "gke_cluster_name" {
  value = google_container_cluster.primary.name
}
output "gke_endpoint" {
  value = google_container_cluster.primary.endpoint
}
output "subnet_self_link" {
  value = google_compute_subnetwork.subnet.self_link
}
output "db_instance_connection_name" {
  value = google_sql_database_instance.default.connection_name
}
output "db_private_ip" {
  value = google_sql_database_instance.default.private_ip_address
}
output "gcs_bucket_url" {
  value = "gs://${google_storage_bucket.logi_app_bucket.name}"
}
output "pubsub_topic_name" {
  value = google_pubsub_topic.shipment_topic.name
}
output "gke_default_sa" {
  value = google_container_node_pool.primary_nodes.node_config[0].service_account
}