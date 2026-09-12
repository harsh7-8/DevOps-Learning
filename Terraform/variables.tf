variable "region" {
  description = "AWS Region where resource will be created"
  type        = string
  default     = "us-east-1"
}

variable "policyname" {
  description = "AWS IAM policy name"
  type        = string
  default     = "Admin-IAM-Policy"
}

variable "bucketname" {
  description = "AWS S3 bucket to store objects"
  type        = string
  default     = "hdc-s3-testing"
}

variable "aws_iam_user" {
  description = "IAM user"
  type        = string
  default     = "Terraform-admin-user"

}