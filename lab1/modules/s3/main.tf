resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket-name
}

resource "aws_iam_role" "role" {
  name = "EC2-role-new"

  assume_role_policy = jsonencode({
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Effect" : "Allow"
      }
    ]
  })
}

resource "aws_iam_policy" "bucket_policy" {
  name        = var.bucket-name
  path        = "/"
  description = "Allow"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
        ],
        Resource = [
          "arn:aws:s3:::${var.bucket-name}",
          "arn:aws:s3:::${var.bucket-name}/*",
        ],
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "bucket_policy" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.bucket_policy.arn
}

resource "aws_iam_instance_profile" "profile" {
  name = "instance-profile-devops"
  role = aws_iam_role.role.name
}
