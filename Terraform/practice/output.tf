output "aws_iam_user" {
  value = aws_iam_user.iam_user.name
}

output "aws_iam_policy" {
  value = aws_iam_policy.iam_policy.arn

}



output "aws_s3_bucket" {
  value = aws_s3_bucket.test-bucket.bucket

}
