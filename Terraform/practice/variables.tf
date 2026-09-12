variable "region" {
  description = "AWS Region where resource will be created"
  type        = string
  default     = "us-east-1"
}

variable "iam_username" {
  description = "AWS IAM username"
  type        = string
  default     = "harsh-root"

}

variable "iam_policy" {
  description = "AWS IAM policy to be created"
  type        = string
  default     = "root-privileage"

}


variable "s3_bucket" {
  description = "AWS s3 bucket"
  type        = string
  default     = "harsh-test-bucket789"

}

