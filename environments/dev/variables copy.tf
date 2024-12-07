variable "region" {
  description = "My AWS Region for Provisioning Infrastructure"
  type = string
}

variable "access_key" {
  description = "My aws access_key"
  type = string
  sensitive = true
}

variable "secret_key" {
  description = "My aws secret key"
  type = string
  sensitive = true
}

