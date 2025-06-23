resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = var.bucket_name
  tags = var.tags
  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled
}

resource "aws_s3_bucket_versioning" "name" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  versioning_configuration {
    status = var.status
  }
}