output "bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "bucket_policy" {
  value = data.aws_iam_policy_document.bucket_policy.json
}

output "kms_key_arn" {
  value = aws_kms_key.objects.arn
}

output "iam_role_arn" {
  value = aws_iam_role.iam.arn
}

