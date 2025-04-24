resource "aws_iam_role" "lambda" {
  count = local.create_role ? 1 : 0

  name                  = local.role_name
  description           = var.role_description
  path                  = var.role_path
  force_detach_policies = var.role_force_detach_policies
  permissions_boundary  = var.role_permissions_boundary
  assume_role_policy    = data.aws_iam_policy_document.assume_role[0].json
  max_session_duration  = var.role_maximum_session_duration

  tags = merge(var.tags, var.role_tags)
}