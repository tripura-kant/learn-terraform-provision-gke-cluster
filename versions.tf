terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.27.0"
    }
  }

  required_version = ">= 0.14"
}

provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("F:/Repo-all/terraform/fiverr/New folder/molten-enigma-386006-2afa6ef7914c.json")
  zone = var.zone
}

