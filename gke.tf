# # data "google_service_account" "gke_sa" {
# #    account_id = "Change me  gke-service-account-id"
# #    project    = var.project_id
# #  }

# GKE cluster
resource "google_container_cluster" "primary" {
  name                     = var.gke_cluster_name
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = data.google_compute_network.vpc.name
  subnetwork = data.google_compute_subnetwork.subnet.name

  project = var.project_id
  #service_account = data.google_service_account.gke_sa.email
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {




  name       = google_container_cluster.primary.name
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes



  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = var.disk_size_gb
    disk_type    = "pd-balanced"
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    tags = ["test"] 
    labels = {
      env = var.project_id
    }



    metadata = {
      disable-legacy-endpoints = "true"
    }
  }


}

# data "google_container_node_pool" "default" {
#   name = "my-node-pool"
# } 

# output "node_pool_name" {
#   value = data.google_container_node_pool.default.name
# }

resource "google_compute_disk" "disk" {
  name = "gce-nfs-disk"
  size = 100
  type = "pd-standard"
  zone = var.zone
}



# resource "google_compute_attached_disk" "disk_attachment" {
# disk = google_compute_disk.disk.self_link
# instance = google_container_cluster.my-cluster.name
# mode = "READ_WRITE"
# zone = var.zone
# }

#gcloud compute instances list --filter="tags.items=test" --format="value(name)" | head -1
