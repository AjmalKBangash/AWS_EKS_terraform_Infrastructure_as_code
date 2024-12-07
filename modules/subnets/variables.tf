variable "vpc_id" {
  description = "The ID of the VPC where the subnet will be created."
  type        = string
#   default     = "module.vpc.vpc_id" # Reference the VPC ID from the vpc module
}

variable "availability_zone" {
  description = "The availability zone for the subnet."
  type        = string
#   default     = "us-west-2a" # Availability Zone for the subnet
}

variable "enable_resource_name_dns_aaaa_record_on_launch" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records."
  type        = bool
#   default     = false # Default value for AAAA record is false
}

variable "enable_resource_name_dns_a_record_on_launch" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records."
  type        = bool
#   default     = true # Default value for A record is true
}

variable "map_public_ip_on_launch" {
  description = "Indicates whether instances launched into the subnet should be assigned a public IP."
  type        = bool
#   default     = true # Public IP assignment on launch is enabled
}

variable "private_dns_hostname_type_on_launch" {
  description = "The type of DNS hostnames to assign to instances in the subnet at launch."
  type        = string
#   default     = "instance-id" # Set private DNS hostname type to instance-id
}

variable "ajay_subnet_tag" {
  description = "Tags to be assigned to the subnet."
  type        = map(string)
#   default = {
#     Name        = "ajay_pub_subnet_001"
#     Environment = "Production"
#     Project     = "Terraform Learning"
#   }
}

variable "cidr_block" {
  description = "CIDR block for the Subnet"
  type        = string
#   default = "10.0.0.0/24"
}

# variable "ajay_pub_subnet_001_cidr_block" {
#   description = "CIDR block for the Subnet"
#   type        = string
# #   default = "10.0.0.0/24"
# }

# variable "ajay_pub_subnet_002_cidr_block" {
#   description = "CIDR block for the Subnet"
#   type        = string
# #   default = "10.0.1.0/24"
# }

# variable "ajay_pri_subnet_001_cidr_block" {
#   description = "CIDR block for the Subnet"
#   type        = string
# #   default = "10.0.10.0/24"
# }

# variable "ajay_pri_subnet_002_cidr_block" {
#   description = "CIDR block for the Subnet"
#   type        = string
# #   default = "10.0.11.0/24"
# }