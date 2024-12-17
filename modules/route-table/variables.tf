variable "ajay_vpc_id" {
  description = "vpc id for route table to refer to"
  type = string
}

variable "ajay_pub_igw_id" {
  description = "a public subnet internet gateway id for route table"
  type = string
}

variable "ajay_pub_subnet_001_id" {
  description = "public subnet id for route table to associate route table to public subnet for public instances or all type of resources to connect to internet publicly"
  type = string
}

variable "ajay_pub_subnet_002_id" {
  description = "public subnet id for route table to associate route table to public subnet for public instances or all type of resources to connect to internet publicly"
  type = string
}

variable "ajay_public_route_table_id" {
  description = "A route table id created for public subnet"
  type = string
}

variable "ajay_pri_ngw_id" {
  description = "a public subnet not private subnet nat gateway(ngw) id for route table"
  type = string
}

variable "ajay_pri_subnet_001_id" {
  description = "a private subnet id for route table to associate it with private subnet"
  type = string
}

variable "ajay_pri_subnet_002_id" {
  description = "a private subnet id for route table to associate it with private subnet"
  type = string
}

variable "ajay_private_route_table_id" {
  description = "A route table id created for private subnet for private instances inside private subnet to go through nat gateway which is in public subnet"
  type = string
}