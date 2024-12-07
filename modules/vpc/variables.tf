variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "instance_tenancy" {
  description = "vpc tenancy default means shared hardware and dedicated means only for a single vpc"
  type = string
}
variable "enable_dns_hostnames" {
  description = "dns hostnames in vpc by default it is false"
  type = bool
}

variable "enable_network_address_usage_metrics" {
  description = "Metrics means the usage of vpc which will be counted, measured"  
  type = bool
}

# variables.tf
variable "vpc_tags" {
  description = "A map of tags to assign to the VPC"
  type        = map(string)
}


# variable "subnet_cidr_block" {
#   description = "CIDR block for the Subnet"
#   type        = string
# }

# variable "availability_zone" {
#   description = "Availability zone for the Subnet"
#   type        = string
# }

variable "pub_subnet_001_cidr_block" {
  description = "CIDR block for the Subnet"
  type        = string
  default = "10.0.0.0/24"
}

variable "pub_subnet_002_cidr_block" {
  description = "CIDR block for the Subnet"
  type        = string
  default = "10.0.1.0/24"
}

variable "pri_subnet_001_cidr_block" {
  description = "CIDR block for the Subnet"
  type        = string
  default = "10.0.10.0/24"
}

variable "pri_subnet_002_cidr_block" {
  description = "CIDR block for the Subnet"
  type        = string
  default = "10.0.11.0/24"
}