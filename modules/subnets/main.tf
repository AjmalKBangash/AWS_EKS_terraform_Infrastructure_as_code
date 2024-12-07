resource "aws_subnet" "ajay_pub_subnet_001" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone
  enable_resource_name_dns_aaaa_record_on_launch = var.enable_resource_name_dns_aaaa_record_on_launch
  enable_resource_name_dns_a_record_on_launch = var.enable_resource_name_dns_a_record_on_launch 
  map_public_ip_on_launch = var.map_public_ip_on_launch
  private_dns_hostname_type_on_launch = var.private_dns_hostname_type_on_launch 

  tags = var.ajay_subnet_tag

#   tags = {
#     Name = "Main"
#   }
}