module "vpc" {
  source           = "../../modules/vpc"
  cidr_block       = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
}

module "ec2_instance" {
  source        = "../../modules/ec2-instance"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
}
