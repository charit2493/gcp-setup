resource "google_service_account" "accounts" {
  for_each   = toset(var.accounts)
  account_id = each.key
  project    = var.project_id
}

resource "google_project_iam_member" "sa_bindings" {
  for_each = {
    for sa, roles in var.iam_roles :
    "${sa}" => {
      email = google_service_account.accounts[sa].email
      roles = roles
    }
  }

  project = var.project_id
  role    = element(each.value.roles, 0)
  member  = "serviceAccount:${each.value.email}"

  lifecycle {
    create_before_destroy = true
  }
}