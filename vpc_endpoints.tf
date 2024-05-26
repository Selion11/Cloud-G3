resource "aws_vpc_endpoint" "dynamodb_endpoint" {
  vpc_id            = aws_vpc.main_vpc.id
  service_name      = "com.amazonaws.${var.aws_region}.dynamodb"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [aws_vpc.main_vpc.main_route_table_id]

  tags = {
    Name = "DynamoDBEndpoint"
  }
}

resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id            = aws_vpc.main_vpc.id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [aws_vpc.main_vpc.main_route_table_id]

  tags = {
    Name = "S3Endpoint"
  }
}
