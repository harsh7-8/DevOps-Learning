output "aws_user_name" {
  value = aws_iam_user.my-user.name
}

output "aws_iam_policy" {
  value = aws_iam_policy.AdminPolicy.arn
}

output "s3_bucketname" {
  value = aws_s3_bucket.my-bucket.bucket
}

output "aws_iam_policy_arn" {
  value = aws_iam_policy.AdminPolicy.arn

}