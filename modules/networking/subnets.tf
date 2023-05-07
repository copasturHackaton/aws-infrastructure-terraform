resource "aws_subnet" "private" {
  count                   = length(var.private_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnets[count.index]
  availability_zone       = var.az_list[count.index]
  map_public_ip_on_launch = false
  tags = merge(
    var.tags,
    {
      Name = "private_subnet_${count.index}"
    }
  )
}

resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = var.az_list[count.index]
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      Name = "public_subnet_${count.index}"
    }
  )
}
