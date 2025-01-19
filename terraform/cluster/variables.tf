variable "cluster_name" {
  type = string
}

variable "kubernetes_version" {
  type = string
  default = "1.31"
}

variable "workers_count" {
  type    = number
  default = "1"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "node_group_desired_size" {
  type    = number
  default = 1
}

variable "node_group_min_size" {
  type    = number
  default = 1
}

variable "node_group_max_size" {
  type    = number
  default = 10
}

variable "node_group_disk_size" {
  type    = number
  default = 50
}