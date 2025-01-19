resource "aws_iam_role" "eks_role" {
  name = var.cluster_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    ManagedPolicyArns = [
      "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
      "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
    ],
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_role.name
}

resource "aws_iam_role" "eks_nodes_role" {
  name = "${var.cluster_name}-nodes"

  assume_role_policy = jsonencode({
    ManagedPolicyArns = [
      "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
      "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
      "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    ]
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_policy" "eks_policy" {
  name        = "${var.cluster_name}-policy"
  description = "EKS policy"

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action   = "ec2:CreateTags"
        Effect   = "Allow"
        Resource = "arn:aws:ec2:*:*:instance/*"
        Condition = {
          ForAnyValue:StringLike = {
            "aws:TagKeys" = "kubernetes.io/cluster/*"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "eks_nodes_policy" {
  name        = "${var.cluster_name}-nodes"
  description = "EKS nodes policy"

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action   = "ec2:DescribeInstances"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "ec2:DescribeNetworkInterfaces"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "ec2:DescribeVpcs"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "ec2:DescribeDhcpOptions"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "ec2:DescribeAvailabilityZones"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "ec2:DescribeInstanceTopology"
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "kms:DescribeKey"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}