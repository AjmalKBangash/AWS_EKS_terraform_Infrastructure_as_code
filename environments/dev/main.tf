module "vpc" {
  source           = "../../modules/vpc"
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy
  enable_network_address_usage_metrics = var.enable_network_address_usage_metrics
  enable_dns_hostnames = var.enable_dns_hostnames # by default false
  vpc_tags = var.vpc_tags
}

module "igw" {
  source = "../../modules/igw"
  vpc_id = module.vpc.vpc_id
  igw_tags = var.igw_tags
}

module "ajay_pub_subnet_001" {
  source                    = "../../modules/subnets"  # Reference to your subnet module
  vpc_id                    = module.vpc.vpc_id  # Pass VPC ID from the VPC module
  cidr_block                = "10.0.0.0/24"  # CIDR block for the subnet
  availability_zone         = "us-west-2a"  # Availability zone
  enable_resource_name_dns_aaaa_record_on_launch = false  # Disable DNS AAAA record
  enable_resource_name_dns_a_record_on_launch    = true   # Enable DNS A record
  map_public_ip_on_launch   = true  # Map public IP on launch
  private_dns_hostname_type_on_launch = "resource-name"  # Set DNS hostname type as instance ID
  ajay_subnet_tag   = {
    Name        = "ajay_pub_subnet_001_tag"
    Environment = "dev"
    Project     = "Terraform Learning"
  }
}

module "ajay_pri_subnet_001" {
  source                    = "../../modules/subnets"  # Reference to your subnet module
  vpc_id                    = module.vpc.vpc_id  # Pass VPC ID from the VPC module
  cidr_block                = "10.0.10.0/24"  # CIDR block for the subnet
  availability_zone         = "us-west-2a"  # Availability zone
  enable_resource_name_dns_aaaa_record_on_launch = false  # Disable DNS AAAA record
  enable_resource_name_dns_a_record_on_launch    = true   # Enable DNS A record
  map_public_ip_on_launch   = true  # Map public IP on launch but false for private subnet
  private_dns_hostname_type_on_launch = "resource-name"  # Set DNS hostname type as instance ID
  ajay_subnet_tag   = {
    Name        = "ajay_pri_subnet_001_tag"
    Environment = "dev"
    Project     = "Terraform Learning"
  }
}






# module "ec2_instance" {
#   source        = "../../modules/ec2-instance"
#   ami           = var.ami
#   instance_type = var.instance_type
#   subnet_id     = module.vpc.subnet_id
# }
