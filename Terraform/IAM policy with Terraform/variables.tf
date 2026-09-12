variable "region" {
  description = "AWS region where the resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "iam_username" {
  description = "The IAM username to create"
  type        = string
  default     = "terraform-test-user"
}

