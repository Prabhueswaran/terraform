module "iam_policy" {
  source = "terraform-aws-modules/iam/aws//modules/iam-policy"

  name        = "my_policy"
  path        = "/"
  description = "My example policy"

  policy = data.aws_iam_policy_document.ec2_policy.json
}