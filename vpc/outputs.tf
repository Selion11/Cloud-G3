output "subnet_ids" {
  value = aws_subnet.vacunatorio_subnet[*]
  description = "The IDs of the subnets created in the VPC"
}