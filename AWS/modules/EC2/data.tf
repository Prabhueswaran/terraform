# data "aws_ami" "ubuntu_ami_latest" {
#   owners      = var.ami_owners
#   most_recent = true

#   filter {
#     name   = "name"
#     values = var.ami_name
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }