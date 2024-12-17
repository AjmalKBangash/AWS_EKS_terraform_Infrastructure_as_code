variable "ajay_iam_role_name" {
  description = "iam role name"
  type = string
}

variable "ajay_iam_role_description" {
  description = "ajay_iam_role_description"
  type = string
}

variable "ajay_iam_role_assume_role_policy" {
  description = "ajay_iam_role_assume_role_policy"
  type = string
}

variable "ajay_iam_role_tags" {
  description = "tags for ajay iam role .."
  type = map(string)
}

variable "ajay_iam_role_policy_name" {
  description = "The name of the role policy. If omitted, Terraform will assign a random, unique name."
  type = string
}

variable "ajay_iam_role_policy_policy" {
  description = " (Required) The inline policy document. This is a JSON formatted string"
  type = string
}

variable "ajay_iam_role_policy_role" {
  description = "(Required) The name of the IAM role to attach to the policy."
  type = string
}

variable "ajay_iam_role_max_session_duration" {
  description = "ajay_iam_role_max_session_duration"
  type = string
}

# variable "ajay_aws_iam_policy_name" {
#   description = "ajay_aws_iam_policy_name"
#   type = string
# }

# variable "ajay_iam_policy_description" {
#   description = "ajay_iam_policy_description"
#   type = string
# }

# variable "ajay_iam_policy_policy" {
#   description = "ajay_iam_policy_policy"
#   type = string
# }

# variable "ajay_aws_iam_role_policy_attachment_role" {
#   description = "ajay_aws_iam_role_policy_attachment_role"
#   type = string
# }

# variable "ajay_aws_iam_role_policy_attachment_policy_arn" {
#   description = "ajay_aws_iam_role_policy_attachment_policy_arn"
#   type = string
# }

