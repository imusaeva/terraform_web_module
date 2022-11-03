resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(var.az, count.index)
  tags              = merge(local.common_tags, { Name = replace(local.name, "rtype", "public_subnet") })
}
resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.private_subnet_cidr, count.index)
  availability_zone = element(var.az, count.index)
  tags              = merge(local.common_tags, { Name = replace(local.name, "rtype", "private_subnet") })
}