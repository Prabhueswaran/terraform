# resource "aws_s3_bucket" "my_s3_bucket" {
#   bucket = "my-tf-devops-bucket-2024"
#   tags = {
#     name        = "project1"
#     environment = "dev"
#   }
#   force_destroy       = false
#   object_lock_enabled = true
# }

module "s3" {
  source = "../../../../AWS/modules/S3/"
  bucket_name = local.bucket_name
  force_destroy = false
  object_lock_enabled = false
  tag = [ "dev", "project1" ]
}