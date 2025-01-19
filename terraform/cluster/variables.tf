variable "cluster_name" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "workers_count" {
  type    = number
  default = "1"
}

variable "region" {
  type = string
}