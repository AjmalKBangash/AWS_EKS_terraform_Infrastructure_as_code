resource "aws_iam_role" "ajay_iam_role" {
#   name = "eks-control-plane-role"
  name = var.ajay_iam_role_name

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "eks.amazonaws.com"
#         }
#       },
#     ]
#   })
  assume_role_policy = var.ajay_iam_role_assume_role_policy
  force_detach_policies = false
  description = var.ajay_iam_role_description
  max_session_duration = var.ajay_iam_role_max_session_duration

}

resource "aws_iam_role_policy" "ajay_iam_role_policy" {
  name = var.ajay_iam_role_policy_name
  policy = var.ajay_iam_role_policy_policy 
  role = var.ajay_iam_role_policy_role
}














# WE CAN ATTCH THIS IAM ROLE POLICY TO ANYTHING LIKE ROLES, USERS , GROUPS THROUGH IAM ROLE POLICY ATTACHMENT TO ONLY IAM ROLE AND IAM POLICY ATTACHMENT TO ANYONE 
# resource "aws_iam_policy" "ajay_eks_control_plane_policy" {
# #   name        = "eks-control-plane-policy"
#   name = var.ajay_aws_iam_policy_name
# #   description = "Policy for EKS Control Plane to manage AWS resources"
#   description = var.ajay_iam_policy_description
  
#   # The policy granting permissions to manage EKS resources
# #   policy = jsonencode({
# #     Version = "2012-10-17"
# #     Statement = [
# #       {
# #         Action = [
# #           "ec2:DescribeInstances",
# #           "ec2:DescribeSecurityGroups",
# #           "ec2:DescribeVpcs",
# #           "ec2:CreateSecurityGroup",
# #           "ec2:CreateVPC",
# #           "ec2:DeleteSecurityGroup",
# #           "ec2:DeleteVPC",
# #           "ec2:CreateNetworkInterface",
# #           "ec2:DeleteNetworkInterface",
# #           "ec2:AttachNetworkInterface",
# #           "ec2:DescribeNetworkInterfaces",
# #           "ec2:DescribeKeyPairs",
# #           "ec2:DescribeInstanceTypes",
# #           "iam:PassRole",
# #           "iam:GetRole",
# #           "iam:ListRoles",
# #           "iam:ListAttachedRolePolicies",
# #           "iam:AttachRolePolicy",
# #           "iam:CreateRole",
# #           "iam:CreatePolicy",
# #           "iam:DeleteRole",
# #           "iam:DeletePolicy",
# #           "iam:PutRolePolicy",
# #           "iam:DetachRolePolicy",
# #           "ecr:GetAuthorizationToken",
# #           "ecr:BatchCheckLayerAvailability",
# #           "ecr:GetRepositoryPolicy",
# #           "ecr:DescribeRepositories",
# #           "eks:DescribeCluster",
# #           "eks:UpdateClusterVersion",
# #           "eks:CreateFargateProfile",
# #           "eks:DeleteFargateProfile",
# #           "eks:DescribeFargateProfile",
# #           "eks:CreateNodegroup",
# #           "eks:DeleteNodegroup",
# #           "eks:DescribeNodegroup",
# #           "eks:UpdateNodegroupConfig",
# #           "eks:UpdateNodegroupVersion"
# #         ]
# #         Effect = "Allow"
# #         Resource = "*"
# #       },
# #       {
# #         Action = [
# #           "logs:DescribeLogGroups",
# #           "logs:CreateLogGroup",
# #           "logs:PutRetentionPolicy",
# #           "logs:CreateLogStream",
# #           "logs:PutLogEvents",
# #           "logs:DescribeLogStreams"
# #         ]
# #         Effect = "Allow"
# #         Resource = "*"
# #       }
# #     ]
# #   })
#   policy = var.ajay_iam_policy_policy
# }

# resource "aws_iam_role_policy_attachment" "ajay_eks_role_policy_attachment" {
# #   role       = aws_iam_role.ajay_eks_control_plane.name
#   role = var.ajay_aws_iam_role_policy_attachment_role
# #   policy_arn = aws_iam_policy.ajay_eks_control_plane_policy.arn
#   policy_arn = var.ajay_aws_iam_role_policy_attachment_policy_arn
# }











# policy for aws eks cluster control plane 
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "ec2:*",
#           "ecr:*",
#           "s3:*",
#           "cloudwatch:*",
#           "autoscaling:*",
#           "eks:*",
#           "iam:PassRole",
#           "logs:*",
#           "route53:*",
#           "vpc:*",
#           "kinesis:*",
#           "sns:*",
#           "cloudformation:*",
#           "dynamodb:*",
#           "stepfunctions:*",
#           "secretsmanager:*",
#           "kafka:*",
#           "elasticsearch:*",
#           "rds:*",
#           "lambda:*",
#           "ssm:*",
#           "events:*",
#           "acm:*"
#         ],
#         Resource = "*"
#       }
#     ]
#   })


# woker nodes policy for interacting with aws services from aws eks custer worker nodes 
  # policy = jsonencode({
  #   Version = "2012-10-17"
  #   Statement = [
  #     {
  #       Effect = "Allow"
  #       Action = [
  #         "ec2:*",
  #         "ecr:*",
  #         "s3:*",
  #         "cloudwatch:*",
  #         "autoscaling:*",
  #         "eks:*",
  #         "iam:PassRole",
  #         "logs:*",
  #         "kinesis:*",
  #         "sns:*",
  #         "cloudformation:*",
  #         "route53:*",
  #         "vpc:*",
  #         "dynamodb:*"
  #       ],
  #       Resource = "*"
  #     }
  #   ]
  # })
