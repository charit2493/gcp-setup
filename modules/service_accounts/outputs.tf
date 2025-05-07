output "sa_ids" {
  value = { for acc in google_service_account.accounts : acc.account_id => acc.email }
}