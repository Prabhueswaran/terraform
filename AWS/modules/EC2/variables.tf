variable "availability_zone" {
  type    = string
  default = ""
}

variable "environment" {
  type        = string
  description = "Current env"
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "name" {
  type        = string
  description = "Preferrably the FQDN of instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet containing the instances"
}

# variable "ebs_kms_key_id" {
#   type        = string
#   description = "KMS encryption key for EBS volumes"
# }

variable "ebs_type" {
  type    = string
  default = "gp3"
}

variable "ebs_iops" {
  type        = string
  description = "AWS defaults for EBS volume IOPS"
  default     = 3000
}

variable "ebs_throughput" {
  type        = string
  description = "AWS defaults for EBS volume MiB/s"
  default     = 125
}

variable "default_ebs_root_size" {
  type        = number
  description = "Root block device size by default"
  default     = 8
}

variable "ebs_root_size" {
  type    = number
  default = null
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

# for_each

# variable "instance_volumes" {
#   type = map(object({
#     size       = number
#     device     = string
#     type       = optional(string)
#     iops       = optional(number)
#     throughput = optional(number)
#   }))
# }

#Count

variable "instance_volumes" {
    type = list(object({
    size       = number
    device     = string
    type       = optional(string)
    iops       = optional(number)
    throughput = optional(number)
  }))
}

variable "iam_instance_profile" {
  type = string
  default = null
}

variable "ssh_key_name" {
  type = string
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "SGs to associate with the instance"
}

variable "ami_owners" {
  type = list(string)
  default = null
}

variable "ami_name" {
  type    = list(string)
  default = ["Ubuntu Server 24.04 LTS (HVM)"]
}

variable "ami_id" {
  type = string
  default = "ami-0e35ddab05955cf57"
}