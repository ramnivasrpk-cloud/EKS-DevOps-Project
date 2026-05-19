module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.37.2"

  cluster_name    = var.cluster_name
  cluster_version = "1.30"

  subnet_ids = module.vpc.private_subnets
  vpc_id     = module.vpc.vpc_id

  enable_cluster_creator_admin_permissions = false


  iam_role_arn = aws_iam_role.eks_cluster_role.arn

  eks_managed_node_groups = {
    production = {

      desired_size = 2
      max_size     = 3
      min_size     = 2

      instance_types = ["t3.medium"]

      capacity_type = "ON_DEMAND"

      iam_role_arn = aws_iam_role.eks_node_group_role.arn
    }
  }


  tags = {
    Environment = "production"
  }


  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.ecr_readonly_policy,
    aws_iam_role_policy_attachment.cni_policy
  ]
}
