resource "google_service_account" "accounts" {
  for_each   = toset(var.accounts)
  account_id = each.key
  project    = var.project_id
}