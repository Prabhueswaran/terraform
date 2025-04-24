resource "aws_ebs_volume" "volumes" {
  # for_each = var.instance_volumes
  count = length(var.instance_volumes)

  availability_zone = var.availability_zone
  # size              = each.value.size
  size              = var.instance_volumes[count.index].size
  encrypted         = true
  # kms_key_id        = var.ebs_kms_key_id
  # type              = try(each.value.type, var.ebs_type)
  # iops              = try(each.value.iops, var.ebs_iops)
  # throughput        = try(each.value.throughput, var.ebs_throughput)
  type              = try(var.instance_volumes[count.index].type, var.ebs_type)
  iops              = try(var.instance_volumes[count.index].iops, var.ebs_iops)
  throughput        = try(var.instance_volumes[count.index].throughput, var.ebs_throughput)

  tags = merge(
    {
    #  VolumeName  = each.key
      VolumeName = length(var.instance_volumes)
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_instance" "instance" {
  ami                         = var.ami_id
  associate_public_ip_address = true
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  key_name                    = var.ssh_key_name
  iam_instance_profile        = var.iam_instance_profile
  user_data_replace_on_change = false

  root_block_device {
    encrypted             = false
    volume_size           = try(var.ebs_root_size, var.default_ebs_root_size)
    delete_on_termination = false
  }

  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id

  lifecycle {
    ignore_changes = [
      ami
    ]
  }

  tags = merge(
    {
      Name        = var.name,
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_volume_attachment" "volume_attachment" {
  # for_each = var.instance_volumes
  count = length(var.instance_volumes)

  device_name = var.instance_volumes[count.index].device
  volume_id   = aws_ebs_volume.volumes[count.index].id
  # device_name = each.value.device
  # volume_id   = aws_ebs_volume.volumes[each.key].id
  instance_id = aws_instance.instance.id
}
