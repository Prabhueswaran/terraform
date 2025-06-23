variable "bucket_name" {
  type = string
  description = "this is for bucke name"
  default = null
}

variable "tags" {
  type = map(string)
  default =   {
    name        = "project1"
    environment = "dev"
  }
}

variable "force_destroy" {
  type = bool
  default = false
  description = "s3 bucket force destroy"
}

variable "object_lock_enabled" {
  type = bool
  default = false
  description = "S3 Bucket object_lock_enabled"
}

variable "status" {
  type = string
  default = "Disabled"
  description = "S3 Versioning"
}