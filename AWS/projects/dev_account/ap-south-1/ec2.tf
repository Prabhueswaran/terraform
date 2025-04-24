module "devopsvm" {
  source                 = "../../../modules/EC2"
  name                   = "devops"
  environment            = "Production"
  availability_zone      = "ap-south-1a"
  ssh_key_name           = "devops_key"
  subnet_id              = "subnet-0e39f5e4c1d490f48"
  vpc_security_group_ids = ["sg-0161bbc38838ef7ef"]
  instance_volumes       = local.ebs_vol
  tags = {
    project = "testing"
    team    = "devops"
  }
}