variable "project_id" {
  description = "The ID of the GCP project where the GKE cluster will be created."
  type        = string
}

variable "region" {
  description = "Region in which the GKE cluster will be deployed."
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster."
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the node pool if autoscaling is disabled."
  type        = number
  default     = 3
}

variable "enable_autoscaling" {
  description = "Flag to enable autoscaling for the node pool."
  type        = bool
  default     = false
}

variable "min_count" {
  description = "Minimum number of nodes for autoscaling."
  type        = number
  default     = 1
}

variable "max_count" {
  description = "Maximum number of nodes for autoscaling."
  type        = number
  default     = 5
}

variable "machine_type" {
  description = "Machine type to use for nodes."
  type        = string
  default     = "e2-medium"
}

variable "network" {
  description = "The name of the VPC network to attach the cluster to."
  type        = string
}

variable "subnetwork" {
  description = "The name of the subnetwork to attach the cluster to."
  type        = string
}

variable "service_account_id" {
  description = "Service account email to attach to the GKE nodes."
  type        = string
}