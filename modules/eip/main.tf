resource "aws_eip" "ajay_eip_for_ngw" {
  domain   = var.ajay_eip_domain
  # address = var.address
  # associate_with_private_ip = var.associate_with_private_ip 
  # instance = var.instance
  # network_border_group = var.network_border_group 
  # network_interface = var.network_interface
  depends_on = [var.ajay_eip_depends_on_igw]

  tags = var.ajay_eip_tags
}