provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("F:/Repo-all/terraform/fiverr/New folder/molten-enigma-386006-2afa6ef7914c.json")
  zone = var.zone
}


# provider "google" {
#   credentials = file("F:/Repo-all/terraform/fiverr/New folder/molten-enigma-386006-2afa6ef7914c.json")
#   project     = "your-project-id"
#   region      = "us-central1"
#   zone        = "us-central1-a"
# }

# VPC
data "google_compute_network" "vpc" {
  name = "default"
}

# Subnet
data "google_compute_subnetwork" "subnet" {
  name   = "default"
  region = "us-central1"
}

