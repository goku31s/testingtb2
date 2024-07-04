resource "google_service_account" "mysa" {
  account_id   = "my-service-account"
  display_name = "mynewsa"
}
 
resource "google_project_iam_member" "sa_editor_role" {
  project = "propane-terra-416223"  # replace with your GCP project ID
  role    = "roles/editor"
member = "serviceAccount:${google_service_account.mysa.email}"
}

