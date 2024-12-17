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
    Project     = "Terraform Provisioning"
  }
}

module "ajay_pub_subnet_002" {
  source                    = "../../modules/subnets"  # Reference to your subnet module
  vpc_id                    = module.vpc.vpc_id  # Pass VPC ID from the VPC module
  cidr_block                = "10.0.1.0/24"  # CIDR block for the subnet
  availability_zone         = "us-west-2b"  # Availability zone
  enable_resource_name_dns_aaaa_record_on_launch = false  # Disable DNS AAAA record
  enable_resource_name_dns_a_record_on_launch    = true   # Enable DNS A record
  map_public_ip_on_launch   = true  # Map public IP on launch
  private_dns_hostname_type_on_launch = "resource-name"  # Set DNS hostname type as instance ID
  ajay_subnet_tag   = {
    Name        = "ajay_pub_subnet_002_tag"
    Environment = "dev"
    Project     = "Terraform Provisioning"
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
    Project     = "Terraform Provisioning"
  }
}

module "ajay_pri_subnet_002" {
  source                    = "../../modules/subnets"  # Reference to your subnet module
  vpc_id                    = module.vpc.vpc_id  # Pass VPC ID from the VPC module
  cidr_block                = "10.0.11.0/24"  # CIDR block for the subnet
  availability_zone         = "us-west-2b"  # Availability zone
  enable_resource_name_dns_aaaa_record_on_launch = false  # Disable DNS AAAA record
  enable_resource_name_dns_a_record_on_launch    = true   # Enable DNS A record
  map_public_ip_on_launch   = true  # Map public IP on launch but false for private subnet
  private_dns_hostname_type_on_launch = "resource-name"  # Set DNS hostname type as instance ID
  ajay_subnet_tag   = {
    Name        = "ajay_pri_subnet_002_tag"
    Environment = "dev"
    Project     = "Terraform Provisioning"
  }
}


module "eip" {
  source = "../../modules/eip"
  ajay_eip_domain = "vpc"
  ajay_eip_depends_on_igw = module.igw.ajay_igw_id

  ajay_eip_tags = {
    Name = "ajay_eip_tag"
    Environment = "dev"
    Project = "Terraform Provisioning"
  }
}

module "ngw" {
  source = "../../modules/ngw"
  ajay_ngw_eip_allocation_id = module.eip.ajay_eip_allocation_id
  ajay_subnet_id_for_ngw = module.ajay_pub_subnet_001.ajay_subnet_id
  ajay_ngw_connectivity_type = "public"
  ajay_ngw_depends_on_igw = module.igw.ajay_igw_id

  ajay_ngw_tags = {
    Name = "ajay_ngw_tag"
    Environment = "dev"
    Project = "Terraform Provisioning"
  }
}

# module "ajay_public_route_table" {
module "route_tables" {
  source = "../../modules/route-table"
  ajay_vpc_id = module.vpc.vpc_id
  ajay_pub_igw_id = module.igw.ajay_igw_id
# }

# module "ajay_public_subnet_association" {
  # source = "../../modules/route-table"
  ajay_pub_subnet_001_id = module.ajay_pub_subnet_001.ajay_subnet_id
  ajay_pub_subnet_002_id = module.ajay_pub_subnet_001.ajay_subnet_id
  # ajay_public_route_table_id = module.ajay_public_route_table.ajay_public_route_table_id
  ajay_public_route_table_id = module.route_tables.ajay_public_route_table_id
# }

/////////
# module "ajay_private_route_table" {
  # source = "../../modules/route-table"
  # vpc_id = module.vpc.vpc_id
  ajay_pri_ngw_id = module.ngw.ajay_ngw_id
# }

# module "ajay_private_subnet_association" {
  # source = "../../modules/route-table"
  ajay_pri_subnet_001_id = module.ajay_pri_subnet_001.ajay_subnet_id
  ajay_pri_subnet_002_id = module.ajay_pri_subnet_001.ajay_subnet_id
  # ajay_private_route_table_id = module.ajay_private_route_table.ajay_private_route_table_id
  ajay_private_route_table_id = module.route_tables.ajay_private_route_table_id
}
///////////////////////////////////////////////// from here 

# THIS MODULE IS ABOUT CREATING IAM ROLES AND POLICIES FOR ROLES ONLY B/C IT IS "aws_iam_role_policy" WHIXH WILL BE DIRECTLY CONNECTED TO "aws_iam_role"
module "ajay_iam_role_and_policy_for_eks_control_plane" {
  source = "../../modules/iam_role"
  ajay_iam_role_name = "ajay_iam_role_for_eks_control_plane"
  ajay_iam_role_description = "This role is for aws eks cluster control plane ..."
  ajay_iam_role_assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
  ajay_iam_role_tags = {
    Name = "ajay_iam_role_for_eks_control_plane_tags"
    Environment = "dev"
  }
  ajay_iam_role_policy_name = "ajay_iam_role_policy_for_control_plane"
  ajay_iam_role_policy_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:*",
          "ecr:*",
          "s3:*",
          "cloudwatch:*",
          "autoscaling:*",
          "eks:*",
          "iam:PassRole",
          "logs:*",
          "route53:*",
          "vpc:*",
          "kinesis:*",
          "sns:*",
          "cloudformation:*",
          "dynamodb:*",
          "stepfunctions:*",
          "secretsmanager:*",
          "kafka:*",
          "elasticsearch:*",
          "rds:*",
          "lambda:*",
          "ssm:*",
          "events:*",
          "acm:*"
        ],
        Resource = "*"
      }
    ]
  })
  ajay_iam_role_policy_role = module.ajay_iam_role_and_policy_for_eks_control_plane.ajay_iam_role_name_output
  ajay_iam_role_max_session_duration = 7200
}

module "ajay_iam_role_and_policy_for_eks_worker_nodes" {
  source = "../../modules/iam_role"
  ajay_iam_role_name = "ajay_iam_role_for_eks_worker_nodes"
  ajay_iam_role_description = "This role is for aws eks cluster worker nodes ..."
  ajay_iam_role_assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
  ajay_iam_role_tags = {
    Name = "ajay_iam_role_for_eks_worker_nodes_tags"
    Environment = "dev"
  }
  ajay_iam_role_policy_name = "ajay_iam_role_policy_for_worker_nodes"
  ajay_iam_role_policy_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:*",
          "ecr:*",
          "s3:*",
          "cloudwatch:*",
          "autoscaling:*",
          "eks:*",
          "iam:PassRole",
          "logs:*",
          "kinesis:*",
          "sns:*",
          "cloudformation:*",
          "route53:*",
          "vpc:*",
          "dynamodb:*"
        ],
        Resource = "*"
      }
    ]
  })
  ajay_iam_role_policy_role = module.ajay_iam_role_and_policy_for_eks_worker_nodes.ajay_iam_role_name_output
  ajay_iam_role_max_session_duration = 7200
}



