variable "bucket_name" {
  type = string
  description = "bucket name"
}

variable "tag" {
  type = list(string)
#   default = [ "project1", "dev" ]
}

variable "force_destroy" {
#   default = false
}

variable "object_lock_enabled" {
#   default = false
}