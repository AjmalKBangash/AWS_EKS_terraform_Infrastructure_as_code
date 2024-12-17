resource "aws_eks_cluster" "ajay_eks_cluster" {
#   name = "ajay_eks_cluster"
  name = var.ajay_aws_eks_cluster_name
  
  role_arn = var.ajay_role_arn_for_eks_control_plane

  vpc_config {
    endpoint_private_access = var.ajay_eks_cluster_endpoint_private_access # default = false
    endpoint_public_access = var.ajay_eks_cluster_endpoint_public_access # default = true
    subnet_ids = [
      var.ajay_aws_subnet_id1,
      var.ajay_aws_subnet_id2,
      var.ajay_aws_subnet_id3,
      var.ajay_aws_subnet_id4,
    ]
  }

  access_config {
    authentication_mode = var.authentication_mode
    bootstrap_cluster_creator_admin_permissions = var.bootstrap_cluster_creator_admin_permissions
  }

  bootstrap_self_managed_addons = var.bootstrap_self_managed_addons

  # Define worker nodes compute configuration for EKS Auto Mode
  compute_config {
    enabled = var.ajay_compute_config_enabled
    # Configuration for node pools (currently general-purpose or system node pools)
    node_pools = var.ajay_compute_config_node_pools
    # Define the IAM role ARN for the worker nodes
    node_role_arn = var.ajay_node_role_arn_for_eks_worker_nodes
  }

  kubernetes_network_config {
    elastic_load_balancing {
       enabled = var.ajay_eks_cluster_elastic_load_balancing_enabled # default value = enabled
    }
    ip_family = var.ajay_eks_cluster_ip_family
  }

  version  = var.version

  zonal_shift_config {
    enabled = var.ajay_eks_cluster_zonal_shifting_enabled  # Enable zonal shifting for the control plane
  }
  # Ensure that IAM Role permissions are created before and deleted
  # after EKS Cluster handling. Otherwise, EKS will not be able to
  # properly delete EKS managed EC2 infrastructure such as Security Groups.
#   depends_on = [
#     aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
#   ]
 
  tags = var.ajay_eks_cluster_tags
  depends_on = var.ajay_eks_cluster_depends_on
}
