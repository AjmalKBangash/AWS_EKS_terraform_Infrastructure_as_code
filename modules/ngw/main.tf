resource "aws_nat_gateway" "ajay_ngw" {
  allocation_id = var.ajay_ngw_eip_allocation_id
  subnet_id     = var.ajay_subnet_id_for_ngw
  connectivity_type = var.ajay_ngw_connectivity_type
  # private_ip = var.private_ip 
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  # depends_on = [aws_internet_gateway.example]
  depends_on = [var.ajay_ngw_depends_on_igw]


  tags = var.ajay_ngw_tags

}