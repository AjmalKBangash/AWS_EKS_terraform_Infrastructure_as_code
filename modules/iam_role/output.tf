output "ajay_iam_role_name_output" {
  value = aws_iam_role.ajay_iam_role.name
}



output "ajay_eks_control_plane_role_arn" {
  value = aws_iam_role.ajay_eks_control_plane.arn
}

output "ajay_eks_control_plane_role_policy_attachment_arn" {
  value = aws_iam_role_policy_attachment.ajay_eks_role_policy_attachment.arn
}

