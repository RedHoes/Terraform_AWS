output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "bucket_policy" {
  value = aws_iam_policy.bucket_policy.policy
}

output "iam_role_arn" {
  value = aws_iam_role.role.arn
}


