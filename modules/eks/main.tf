locals {
  eks_cluster_dependencies = flatten([
    var.ajay_eks_cluster_depends_on
  ])
}

resource "aws_eks_cluster" "ajay_eks_cluster" {
#   name = "ajay_eks_cluster"
  name = var.ajay_aws_eks_cluster_name
  
  role_arn = var.ajay_role_arn_for_eks_control_plane

  vpc_config {
    endpoint_private_access = var.ajay_eks_cluster_endpoint_private_access # default = false
    endpoint_public_access = var.ajay_eks_cluster_endpoint_public_access # default = true
    public_access_cidrs = var.ajay_public_access_cidrs
    # what it should be doe private subnets only or also for pub;ic subnetes as well ????????????????
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
    # what axactly are these and what does it mean ?????????????????????????????????????????
    node_pools = var.ajay_compute_config_node_pools
    # Define the IAM role ARN for the worker nodes
    node_role_arn = var.ajay_node_role_arn_for_eks_auto_compute_nodes
  }

  kubernetes_network_config {
    elastic_load_balancing {
       enabled = var.ajay_eks_cluster_elastic_load_balancing_enabled # default value = enabled
    }
    # service_ipv4_cidr - (Optional) The CIDR block to assign Kubernetes pod and service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks. We recommend that you specify a block that does not overlap with resources in other networks that are peered or connected to your VPC. You can only specify a custom CIDR block when you create a cluster, changing this value will force a new cluster to be created. The block must meet the following requirements:
    # Within one of the following private IP address blocks: 10.0.0.0/8, 172.16.0.0/12, or 192.168.0.0/16.
    # Doesn't overlap with any CIDR block assigned to the VPC that you selected for VPC.
    # Between /24 and /12.
    service_ipv4_cidr = var.ajay_service_ipv4_cidr
    ip_family = var.ajay_eks_cluster_ip_family
  }

  storage_config {
    block_storage {
      enabled = var.ajay_els_cluster_storage_config_block_enabled
    }
  }

  # version  = var.version

  zonal_shift_config {
    enabled = var.ajay_eks_cluster_zonal_shifting_enabled  # Enable zonal shifting for the control plane
  }
  # Ensure that IAM Role permissions are created before and deleted
  # after EKS Cluster handling. Otherwise, EKS will not be able to
  # properly delete EKS managed EC2 infrastructure such as Security Groups.
#   depends_on = [
#     aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
#   ]
 
  depends_on = [var.ajay_eks_cluster_depends_on]
  tags = var.ajay_eks_cluster_tags

}
