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

# # Associate the public subnet with the route table
# resource "aws_route_table_association" "ajay_public_subnet_association" {
#   subnet_id      = var.ajay_pub_subnet_001_id  # The public subnet ID
#   route_table_id = var.ajay_public_route_table_id
# }

# Associate both public subnets with the public route table
resource "aws_route_table_association" "ajay_public_subnet_001_association" {
  subnet_id      = var.ajay_pub_subnet_001_id  # Public Subnet 001
  route_table_id = aws_route_table.ajay_public_route_table.id
}

resource "aws_route_table_association" "ajay_public_subnet_002_association" {
  subnet_id      = var.ajay_pub_subnet_002_id  # Public Subnet 002
  route_table_id = aws_route_table.ajay_public_route_table.id
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

# # Associate the private subnet with the route table
# resource "aws_route_table_association" "ajay_private_subnet_association" {
#   subnet_id      = var.ajay_pri_subnet_001_id  # The private subnet ID
#   route_table_id = var.ajay_private_route_table_id
# }

# Associate both private subnets with the private route table
resource "aws_route_table_association" "ajay_private_subnet_001_association" {
  subnet_id      = var.ajay_pri_subnet_001_id  # Private Subnet 001
  route_table_id = aws_route_table.ajay_private_route_table.id
}

resource "aws_route_table_association" "ajay_private_subnet_002_association" {
  subnet_id      = var.ajay_pri_subnet_002_id  # Private Subnet 002
  route_table_id = aws_route_table.ajay_private_route_table.id
}




# THIS IS THE CONFIGURATION FOR MODULE IF ALLOCATING MULTIPLE SUBNETS AND ONE ROUTE TABLE TO MULTIPLE SUBNETS 

# PUBLIC SUBNETS 
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.ajay_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
# }

# resource "aws_route_table_association" "public" {
#   for_each = toset([aws_subnet.public_1.id, aws_subnet.public_2.id])
#   subnet_id      = each.value
#   route_table_id = aws_route_table.public.id
# }

# PRIVATE SUBNETS 
# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.ajay_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.ngw.id
#   }
# }

# resource "aws_route_table_association" "private" {
#   for_each = toset([aws_subnet.private_1.id, aws_subnet.private_2.id])
#   subnet_id      = each.value
#   route_table_id = aws_route_table.private.id
# }
