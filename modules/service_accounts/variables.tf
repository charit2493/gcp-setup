variable "project_id" {
  description = "The ID of the GCP project where service accounts will be created."
  type        = string
}

variable "accounts" {
  description = "List of service account names to create."
  type        = list(string)
}