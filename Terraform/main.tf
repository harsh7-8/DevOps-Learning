provider "aws" {
  region = var.region
}

resource "aws_iam_user" "my-user" {
  name = var.aws_iam_user
  tags = {
    Purpose = "Learning"
  }
}

resource "aws_iam_policy" "AdminPolicy" {
  name   = var.policyname
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "User-Policy" {
  user       = aws_iam_user.my-user.name
  policy_arn = aws_iam_policy.AdminPolicy.arn

}

resource "aws_s3_bucket" "my-bucket" {
  bucket = var.bucketname
  tags = {
    ENV     = "DEV"
    Purpose = "TESTING"

  }
}