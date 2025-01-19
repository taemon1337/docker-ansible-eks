module "eks_cluster" {
    source = "./cluster"

    cluster_name       = var.cluster_name
    kubernetes_version = var.kubernetes_version
    region = var.region
    role_arn = var.role_arn
    identity_token = var.identity_token
    default_tags = var.default_tags
}