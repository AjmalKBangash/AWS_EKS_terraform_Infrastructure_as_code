resource "aws_nat_gateway" "ajay_ngw" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.example.id
  associate_with_private_ip = var.associate_with_private_ip 
  domain = var.domain 
  instance = var.instance
  network_border_group = var.network_border_group 
  network_interface = var.network_interface
  tags = var.ajay_eip_tags
  

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.example]
}