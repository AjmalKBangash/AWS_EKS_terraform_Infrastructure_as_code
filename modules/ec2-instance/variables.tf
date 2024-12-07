# variable "github_token" {
#   description = "GitHub Personal Access Token"
#   type = string
#   sensitive   = true
# }


variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the EC2 instance"
  type        = string
}
