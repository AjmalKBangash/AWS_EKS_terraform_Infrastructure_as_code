variable "ajay_ngw_eip_allocation_id" {
  description = "aloocation id for ngw from eip"
  type = string
}

variable "ajay_subnet_id_for_ngw" {
  description = "subnet id for nat gateway from public or private subnet which already be created"
  type = string
}

variable "ajay_ngw_connectivity_type" {
  description = "connectivity ype should be public or private, which means that this nat gateway should be private or public (internet facing)"
  type = string
}

variable "ajay_ngw_depends_on_igw" {
  description = "here the internet gateway which is allowing internet acces to aws vpc id should be used"
  type = string
}

variable "ajay_ngw_tags" {
  description = "Use useful and meaningfull tags here for nat gateway so that it can help identity the root cause of these tags"
  type = map(string)
} 