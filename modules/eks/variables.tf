variable "ajay_aws_eks_cluster_name" {
  description = "ajay_aws_eks_cluster_name"
  type = string
}


variable "ajay_role_arn_for_eks_control_plane" {
  description = "This role arn is for aws_eks_cluster control plane to call and use aws other services on your behalf,"
  type = string
}

variable "ajay_node_role_arn_for_eks_auto_compute_nodes" {
  description = "This node role arn is for aws_eks_cluster worker nodes to call and use aws other services on your behalf, like pulling images form aws ecr etc"
  type = string
}

variable "ajay_eks_cluster_elastic_load_balancing_enabled" {
  description = "ajay_eks_cluster_elastic_load_balancing"
  type = bool
}

variable "ajay_eks_cluster_ip_family" {
  description = "ajay_eks_cluster_ip_family"
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

variable "ajay_eks_cluster_endpoint_public_access" {
  description = "whether to allow public access from the internet to vpc and aws eks cluster"
  type = bool
  default = true
}

variable "ajay_eks_cluster_endpoint_private_access" {
  description = "whether to allow private access (inside vpc) from other vpc resources in aws eks cluster"
  type = bool
  default = false
}

variable "ajay_public_access_cidrs" {
  description = "It means that which cidr is allowed to access the public api of our aws eks cluster which should be 0.0.0.0/0 otherwise it will be restricted to few addresses or any ip address for securit, e.g i only allowed it to my public ip then only i am able to ccess the cluster."
  type = set(string)
  default = ["0.0.0.0/0"]
}

variable "ajay_service_ipv4_cidr" {
  description = "The aws eks cluster recommends to specify this cidr whould not overlap incase when you are adding more vpc's through vpc peering where the cluster will be expanding and also this cidr should not overlap with its vpc as well,"
  type = string
}

# variable "version" {
#   description = "version for aws_eks_cluster if not applied then the latest version will be used"
#   type = string
# }

variable "ajay_eks_cluster_zonal_shifting_enabled" {
  description = "ajay_eks_cluster_zonal_shifting_enabled"
  type = bool
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

variable "ajay_els_cluster_storage_config_block_enabled" {
  description = "ajay_els_cluster_storage_config_block_enabled"
  type = bool
}

# variable "ajay_compute_config_node_pools" {
#   description = "A tuple of node pool configurations"
#   type = tuple([
#     object({
#       name     = string
#       instance_type = string
#     }),
#     object({
#       name     = string
#       instance_type = string
#     })
#   ]) # Tuple of objects
#   default = [
#     { name = "general-purpose", instance_type = "t3.medium" },
#     { name = "system", instance_type = "t3.large" }
#   ]
# }
# variable "ajay_compute_config_node_pools" {
#   description = "Node pool configurations"
#   type = list(object({
#     name = string
#     instance_type = string
#   }))
#   default = [
#     { name = "general-purpose", instance_type = "t3.medium" },
#     { name = "system", instance_type = "t3.large" }
#   ]
# }

variable "ajay_compute_config_node_pools" {
  description = "Node pool configuration for the EKS Auto Mode cluster"
  type = list(string)
  default = ["general-purpose", "system"] # Default to include both types of node pools
}


variable "bootstrap_self_managed_addons" {
  description = "Self manaaged add ons which is for networking btw pods and mapping services to pods and container ip addresses etc"
  type = string
}

variable "ajay_eks_cluster_depends_on" {
  description = "A tuple of aws iam roles that the eks cluster is depends on"
  type = tuple([ string ])
}

variable "ajay_eks_cluster_tags" {
  description = "the tags for ajay_eks_cluster "
  type = map(string)
}