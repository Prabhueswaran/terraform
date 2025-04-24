locals {
  bucket_name = "my-tf-devops-bucket-2025"
  # for_each 

  # ebs_vol = {
  #   "vol1" = {
  #     "size"   = 10
  #     "device" = "/dev/sdf"
  #   }
  #   "vol2" = {
  #     "size"   = 12
  #     "device" = "/dev/sdg"
  #   }
  # }

  # Count

  ebs_vol = [
    {
      "size"   = 10
      "device" = "/dev/sdf"
    },
    {
      "size"   = 12
      "device" = "/dev/sdg"
    },
    {
      "size"   = 15
      "device" = "/dev/sdh"
    }
  ]
}
