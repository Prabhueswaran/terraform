resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "my-tf-devops-bucket-2024"
  tags = {
    name        = "project1"
    environment = "dev"
  }
  force_destroy       = false
  object_lock_enabled = true
}