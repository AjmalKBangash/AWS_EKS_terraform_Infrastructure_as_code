variable "ajay_aws_eks_cluster_name" {
  description = "ajay_aws_eks_cluster_name"
  type = string
}

variable "ajay_role_arn_for_eks_control_plane" {
  description = "This role arn is for aws_eks_cluster control plane to call and use aws other services on your behalf,"
  type = string
}

variable "ajay_node_role_arn_for_eks_worker_nodes" {
  description = "This node role arn is for aws_eks_cluster worker nodes to call and use aws other services on your behalf, like pulling images form aws ecr etc"
  type = string
}

variable "authentication_mode" {
  description = "authentication mode for aceessing aws eks cluster "
  type = string
  default = "API"
}

variable "bootstrap_cluster_creator_admin_permissions" {
  description = "Whether to give admin privileges to the owner creating this aws eks cluster"
  type = bool
  default = false
}

variable "public_access" {
  description = "whether to allow public access (internet access) to aws eks k8s api for managing resources "
  type = bool
  default = true
}

variable "private_access" {
  description = "whether to allow private access (inside vpc) to aws eks k8s api for managing resources "
  type = bool
  default = true
}

variable "version" {
  description = "version for aws_eks_cluster if not applied then the latest version will be used"
  type = string
}

variable "ajay_aws_subnet_id1" {
  description = "subnet id 001 id for vpc configuration"
  type = string
}

variable "ajay_aws_subnet_id2" {
  description = "subnet id 002 id for vpc configuration"
  type = string
}

variable "ajay_aws_subnet_id3" {
  description = "subnet id 003 id for vpc configuration"
  type = string
}

variable "ajay_aws_subnet_id4" {
  description = "subnet id 004 id for vpc configuration"
  type = string
}

variable "ajay_compute_config_enabled" {
  description = "ajay_compute_config_enabled"
  type = bool
}

variable "ajay_compute_config_node_pools" {
  description = "ajay_compute_config_node_pools"
  type = tuple([ string ])
}

variable "ajay_eks_cluster_depends_on" {
  description = "A tuple of aws iam roles that the eks cluster is depends on"
  type = tuple([ string ])
}

variable "bootstrap_self_managed_addons" {
  description = "Self manaaged add ons which is for networking btw pods and mapping services to pods and container ip addresses etc"
  type = string
}