variable "ajay_role_arn_for_eks_control_plane" {
  description = "This role arn is for aws_eks_cluster control plane to call and use aws other services on your behalf,"
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

