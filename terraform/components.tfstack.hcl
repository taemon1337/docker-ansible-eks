component "cluster" {
  source = "./cluster"

  providers = {
    aws = provider.aws.main
  }

  inputs = {
    cluster_name       = var.cluster_name
    kubernetes_version = var.kubernetes_version
    region = var.region
  }
}