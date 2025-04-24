data "aws_iam_policy_document" "ec2_policy" {
  statement {
    actions   = ["ec2:Describe*"]
    resources = ["*"]
    effect    = "Allow"
  }
}