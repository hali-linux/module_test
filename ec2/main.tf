resource "aws_instance" "private" {
  key_name               = var.key_name
  ami                    = data.aws_ami.amazon_linux2_kernel_5.id
  instance_type          = var.ec2_type_private
  vpc_security_group_ids = [var.security_group_id_private]
  subnet_id              = var.pri_sub_ids[0]

  iam_instance_profile    = var.iam_instance_profile
  disable_api_termination = var.instance_disable_termination

  user_data = file("${path.module}/user_data/user_data_private.sh")

  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = merge(
    {
      Name = format(
        "%s-private-server",
        var.name
      )
    },
    var.tags,
  )
}
