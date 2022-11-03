resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  route {

    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.ingw.id
  }
  tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "public_rt") })

}

resource "aws_route_table_association" "public_subnet" {
  count          = length(var.private_subnet)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  route {

    cidr_block     = var.cidr_block
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = merge(local.common_tags, { Name = replace(local.name, "rtype", "private_rt") })

}

resource "aws_route_table_association" "private_subnet" {
  count          = length(var.private_subnet)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}