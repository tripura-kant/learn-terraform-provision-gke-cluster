variable "project_id" {
  description = "project id"
}

variable "region" {
  default     = "us-central1-c"
  description = "region"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "gke_cluster_name" {
  default     = "my-first-cluster-1"
  description = "number of gke nodes"
}

variable "disk_size_gb" {
  default     = 100
  description = "cluster disk size minimum 10GB"
}