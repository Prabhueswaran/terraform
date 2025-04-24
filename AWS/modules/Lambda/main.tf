resource "aws_lambda_function" "this" {
  count = local.create && var.create_function && !var.create_layer ? 1 : 0

  function_name                      = var.function_name
  description                        = var.description
  role                               = var.create_role ? aws_iam_role.lambda[0].arn : var.lambda_role
  handler                            = var.package_type != "Zip" ? null : var.handler
  memory_size                        = var.memory_size
  reserved_concurrent_executions     = var.reserved_concurrent_executions
  runtime                            = var.package_type != "Zip" ? null : var.runtime
  layers                             = var.layers
  timeout                            = var.lambda_at_edge ? min(var.timeout, 30) : var.timeout
  publish                            = (var.lambda_at_edge || var.snap_start) ? true : var.publish
  kms_key_arn                        = var.kms_key_arn
  image_uri                          = var.image_uri
  package_type                       = var.package_type
  architectures                      = var.architectures
  code_signing_config_arn            = var.code_signing_config_arn
  skip_destroy                       = var.skip_destroy

  /* ephemeral_storage is not supported in gov-cloud region, so it should be set to `null` */
  dynamic "ephemeral_storage" {
    for_each = var.ephemeral_storage_size == null ? [] : [true]

    content {
      size = var.ephemeral_storage_size
    }
  }

  filename         = local.filename
  source_code_hash = var.ignore_source_code_hash ? null : (local.filename == null ? false : fileexists(local.filename)) && !local.was_missing ? filebase64sha256(local.filename) : null

  s3_bucket         = local.s3_bucket
  s3_key            = local.s3_key
  s3_object_version = local.s3_object_version

  tags = merge(
    { terraform-aws-modules = "lambda" },
    var.tags,
    var.function_tags
  )

}