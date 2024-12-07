resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.ajay_vpc.id
  vpc_id = var.vpc_id

  tags = var.igw_tags
#   tags = {
#     Name = "ajay_vpc_igw"
#   }
}