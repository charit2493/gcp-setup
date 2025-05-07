resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  project                 = var.project_id
}

resource "google_compute_subnetwork" "subnets" {
  for_each                = var.subnets
  name                    = each.key
  ip_cidr_range           = each.value["primary"]
  region                  = var.region
  network                 = google_compute_network.vpc_network.id
  project                 = var.project_id

  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = each.value["pods"]
  }

  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = each.value["services"]
  }
}