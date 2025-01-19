identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "development" {
  inputs = {
    cluster_name        = "my-eks-cluster"
    kubernetes_version  = "1.31"
    region              = "us-east-1"
    role_arn            = "arn:aws:iam::123456789012:role/eks-cluster-role"
    identity_token      = identity_token.aws.jwt
    default_tags        = { stacks-preview-example = "eks-deferred-stack" }
  }
}