output "iam_usrname" {
  value = aws_iam_user.my_user.name
}

output "iam_user_arn" {
  value = aws_iam_user.my_user.arn
}