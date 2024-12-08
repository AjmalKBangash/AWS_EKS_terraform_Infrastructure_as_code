
resource "aws_vpc" "ajay_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy
  enable_dns_support = true
  enable_network_address_usage_metrics = var.enable_network_address_usage_metrics
  enable_dns_hostnames = var.enable_dns_hostnames # by default false

  tags = var.vpc_tags  # Use the vpc_tags variable
}


# Reference the default security group of the pre created VPC
data "aws_security_group" "ajay_vpc_sg" {
  vpc_id = aws_vpc.ajay_vpc.id
}


# ///////////////////////////////////////////////////////////////////////   configuration about vpc security group is started

# # Add ingress rule to default security group 
# we can also add secirity grp rules in this way but the down mentiond and implementaed way is more precise
# resource "aws_security_group_rule" "additional_ingress" {
#   type              = "ingress"
#   security_group_id = data.aws_security_group.ajay_vpc_sg.id
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# # Add egress rule to default security group
# resource "aws_security_group_rule" "additional_egress" {
#   type              = "egress"
#   security_group_id = data.aws_security_group.ajay_vpc_sg.id
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
# }

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4_ajay" {
  security_group_id = data.aws_security_group.ajay_vpc_sg.id
  cidr_ipv4         = aws_vpc.ajay_vpc.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4_ajay" {
  security_group_id = data.aws_security_group.ajay_vpc_sg.id
  cidr_ipv4         = aws_vpc.ajay_vpc.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4_ajay" {
  security_group_id = data.aws_security_group.ajay_vpc_sg.id
  cidr_ipv4         = aws_vpc.ajay_vpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# This rule is by default already added in sg created with vpc 
# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_ajay" {
#   security_group_id = data.aws_security_group.ajay_vpc_sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }

//////////////////////////////////////////////////////////////////////////////// configuration about vpc subnets is started


//////////////////////////////////////////////////////////////////////////////// configuration about vpc subnets is started
# resource "aws_subnet" "main" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.subnet_cidr_block
#   availability_zone = var.availability_zone
# }
