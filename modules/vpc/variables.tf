variable "project_id" {
  description = "The ID of the GCP project to deploy resources in."
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC network."
  type        = string
}

variable "region" {
  description = "Region where the subnetworks will be created."
  type        = string
}

variable "subnets" {
  description = "Map of subnet configurations including primary, pods, and services CIDRs."
  type = map(object({
    primary  = string
    pods     = string
    services = string
  }))
}