# resource "aws_iam_instance_profile" "group_instance_profile" {
#   name = "GroupInstanceProfile"
#   roles = [aws_iam_role.group_access_ec2.id]
# }

# resource "aws_iam_role" "group_access_ec2" {
#   name               = "GroupAccessEC2Role"
#   assume_role_policy = <<EOF
#   {
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Effect": "Allow",
#         "Principal": {
#           "AWS": "arn:aws:iam::${var.account_id}:root"
#         },
#         "Action": "sts:AssumeRole",
#         "Condition": {
#           "StringEquals": {
#             "aws:PrincipalTag/group": "${var.iam_group}"
#           }
#         }
#       } 
#     ]
#   }
#   EOF
# }


