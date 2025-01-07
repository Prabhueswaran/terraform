resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = var.bucket_name
  tags = var.tag
  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled
}

