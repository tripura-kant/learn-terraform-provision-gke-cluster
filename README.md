# GKE Cluster with Teraform

Change values in terraform.tfvars file 
Example
project_id = "savvy-torch-386711"

in gke.tf 

paste the service account details

here

data "google_service_account" "gke_sa" {
  account_id = "gke-service-account-id"
  project    = "your-project-id"
}

