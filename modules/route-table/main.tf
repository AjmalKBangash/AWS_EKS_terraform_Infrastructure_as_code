resource "aws_route_table" "ajay_public_route_table" {
  vpc_id = var.ajay_vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.ajay_pub_igw_id  # Route traffic to IGW
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Associate the public subnet with the route table
resource "aws_route_table_association" "ajay_public_subnet_association" {
  subnet_id      = var.ajay_pub_subnet_001_id  # The public subnet ID
  route_table_id = var.ajay_public_route_table_id
}

/////////////////////////////////////////////////////////////////////////////////////////////////// Thi is for private route table
resource "aws_route_table" "ajay_private_route_table" {
  vpc_id = var.ajay_vpc_id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = var.ajay_pri_ngw_id  # Route traffic to NAT Gateway
  }

  tags = {
    Name = "Private Route Table"
  }
}

# Associate the private subnet with the route table
resource "aws_route_table_association" "ajay_private_subnet_association" {
  subnet_id      = var.ajay_pri_subnet_001_id  # The private subnet ID
  route_table_id = var.ajay_private_route_table_id
}
