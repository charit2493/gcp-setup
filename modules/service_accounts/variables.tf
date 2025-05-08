variable "project_id" {
  description = "The ID of the GCP project where service accounts will be created."
  type        = string
}

variable "accounts" {
  description = "List of service account names to create."
  type        = list(string)
}

variable "iam_roles" {
  description = "Map of roles to assign to each service account. Example: { 'my-sa' = ['roles/viewer'] }"
  type        = map(list(string))
  default     = {}
}