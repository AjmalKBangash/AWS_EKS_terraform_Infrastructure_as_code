variable "vpc_id" {
  description = "This dhoulf br vpc id"
  type = string
}

variable "igw_tags" {
  description = "This is igw tags variable"
  type = map(string)
}