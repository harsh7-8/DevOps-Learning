terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_iam_user" "my_user" {
  name = var.iam_username

  tags = {
    Purpose = "Learning Terraform"
  }
}

resource "aws_iam_policy" "admin-access" {
  name   = "AdminAccess"
  policy = file("admin-access.json")
}

resource "aws_iam_user_policy_attachment" "admin_policy" {
  user       = aws_iam_user.my_user.name
  policy_arn = aws_iam_policy.admin-access.arn
}