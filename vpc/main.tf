resource "aws_subnet" "private" {
  for_each          = var.private_subnets
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value["cidr"]
  availability_zone = each.value["zone"]

  tags = merge(
    {
      Name = format(
        "%s-pri-sub-%s",
        var.name,
        element(split("_", each.key), 2)
      )
    },
    var.tags,
  )
}
