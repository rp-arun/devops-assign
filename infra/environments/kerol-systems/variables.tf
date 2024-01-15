variable "AWS_EKS_ADMIN_ROLE_ARN" {
  type        = string
  default = "arn:aws:iam::<>>:role/tf-admin"
  description = "aws provider assume role arn"
}
