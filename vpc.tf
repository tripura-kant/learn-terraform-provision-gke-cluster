
# VPC
data "google_compute_network" "vpc" {
  name = "default"
}

# Subnet
data "google_compute_subnetwork" "subnet" {
  name   = "default"
  region = "us-central1"
}

