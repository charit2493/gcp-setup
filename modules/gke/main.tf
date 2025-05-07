resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  project  = var.project_id

  # Remove default node pool to use custom configuration
  remove_default_node_pool = true
  initial_node_count       = 1

  # Attach to VPC and subnet created in the network module
  network    = var.network
  subnetwork = var.subnetwork

  # Enable IP aliasing for pod and service CIDRs
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-node-pool"
  location   = var.region
  project    = var.project_id
  cluster    = google_container_cluster.primary.name

  # Number of nodes (used if autoscaling is disabled)
  node_count = var.enable_autoscaling ? null : var.node_count

  # Configuration for nodes in the pool
  node_config {
    machine_type    = var.machine_type
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    service_account = var.service_account_id
  }

  # Optional autoscaling block
  dynamic "autoscaling" {
    for_each = var.enable_autoscaling ? [1] : []
    content {
      min_node_count = var.min_count
      max_node_count = var.max_count
    }
  }
}