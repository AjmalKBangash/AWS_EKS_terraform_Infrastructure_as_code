variable "ajay_eip_domain" {
  description = "The domain should be vpc for eip but it is optional and use it if eip is for using inside vpc"
  type = string
  default = "vpc"
}

variable "ajay_eip_depends_on_igw" {
  description = "The eip dependency if you are using inside vpc and the igw is not cretaed then use depends_on so that igw should first be created and then eip"
  type = string
}

variable "ajay_eip_tags" {
 description = "This is to give tags to aws eip,"
 type = map(string) 
}