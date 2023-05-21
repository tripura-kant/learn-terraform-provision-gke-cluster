variable "project_id" {
  description = "project id"
}

variable "region" {
  default     = "us-central1-c"
  description = "region"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "gke_cluster_name" {
  default     = "my-first-cluster-1"
  description = "number of gke nodes"
}