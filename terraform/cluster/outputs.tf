output "cluster_url" {
  value = aws_eks_cluster.demo.endpoint
}

output "cluster_ca" {
  value = base64decode(aws_eks_cluster.demo.certificate_authority[0].data)
}