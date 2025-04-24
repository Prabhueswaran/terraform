locals {
  create = var.create && var.putin_khuylo
  create_role = local.create && var.create_function && !var.create_layer && var.create_role
  role_name   = local.create_role ? coalesce(var.role_name, var.function_name, "*") : null


  archive_filename        = try(data.external.archive_prepare[0].result.filename, null)
  archive_filename_string = local.archive_filename != null ? local.archive_filename : ""
  archive_was_missing     = try(data.external.archive_prepare[0].result.was_missing, false)

  # Use a generated filename to determine when the source code has changed.
  # filename - to get package from local
  filename    = var.local_existing_package != null ? var.local_existing_package : (var.store_on_s3 ? null : local.archive_filename)
  was_missing = var.local_existing_package != null ? !fileexists(var.local_existing_package) : local.archive_was_missing

  # s3_* - to get package from S3
  s3_bucket         = var.s3_existing_package != null ? try(var.s3_existing_package.bucket, null) : (var.store_on_s3 ? var.s3_bucket : null)
  s3_key            = var.s3_existing_package != null ? try(var.s3_existing_package.key, null) : (var.store_on_s3 ? var.s3_prefix != null ? format("%s%s", var.s3_prefix, replace(local.archive_filename_string, "/^.*//", "")) : replace(local.archive_filename_string, "/^\\.//", "") : null)
  s3_object_version = var.s3_existing_package != null ? try(var.s3_existing_package.version_id, null) : (var.store_on_s3 ? try(aws_s3_object.lambda_package[0].version_id, null) : null)

}