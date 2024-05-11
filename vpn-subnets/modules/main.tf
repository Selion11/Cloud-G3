resource "aws_vpc" "vacunatorio" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    name = var.vpc_name
  }
}

resource "aws_subnet" "vacunatorio_subnet" {
    for_each = {for subnet in var.subnets: subnet.name => subnet}
    vpc_id = aws_vpc.vacunatorio.id
    cidr_block = each.value.cidr_block
    availability_zone = each.value.availability_zone
    public = each.value.public
    tags = {
        name = each.value.name
    }
}