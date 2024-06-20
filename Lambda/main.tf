
data "archive_file" "zip_get_lambda_code" {
    for_each = {for lambda in var.lambda_list: lambda.function_name => lambda}
    type        = lambda.value.f_type
    source_dir  = lambda.value.source_dir
    output_path = lambda.value.output_path
}

resource "aws_lambda_function" "get_lambda" {
  filename         = lambda.value.filename
  function_name    = lambda.value.function_name
  role             = lambda.value.arn
  handler          = lambda.value.handler
  runtime          = lambda.value.runtime
  timeout          = lambda.value.timeout

  vpc_config {
    subnet_ids         = [
      aws_subnet.private_subnet_1.id, 
      aws_subnet.private_subnet_2.id
    ]
    security_group_ids = [
      lambda.value.sec_group_id
    ]
  }

  environment {
    variables = {
      TABLE_NAME = var.dynamodb_table_name
    }
  }

  tags = {
    Name = "GetVacunaFunction"
  }
}
