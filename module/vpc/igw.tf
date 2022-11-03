resource "aws_internet_gateway" "ingw" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.common_tags, { Name = replace(local.name, "rtype", "ingw") })
}

resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = aws_subnet.public_subnet[0].id
  allocation_id = aws_eip.eip.id
  tags          = merge(local.common_tags, { Name = replace(local.name, "rtype", "nat") })
}