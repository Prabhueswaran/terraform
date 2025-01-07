terraform {
  backend "s3" {
    bucket = "ndvhd"
    key = "dev/bscyb.tfstate"
    region = "ap-south-1"
  }
}