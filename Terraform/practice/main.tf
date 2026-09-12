terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"

    }
  }

}


provider "aws" {
  region = var.region
}

resource "aws_iam_user" "iam_user" {
  name = var.iam_username
  tags = {
    env     = "non-prd",
    purpose = "learning"

  }
}

resource "aws_iam_policy" "iam_policy" {
  name   = var.iam_policy
  policy = file("IAM-policy.json")

}


resource "aws_iam_user_policy_attachment" "Root-policy" {
  user       = aws_iam_user.iam_user.name
  policy_arn = aws_iam_policy.iam_policy.arn

}

resource "aws_s3_bucket" "test-bucket" {
  bucket = var.s3_bucket
  tags = {
    env = "dev"


  }
}

