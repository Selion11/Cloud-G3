
data "archive_file" "zip_get_lambda_code" {
    for_each = {for lambda in var.lambda_list: lambda.function_name => lambda}
    type        = var.f_type
    source_dir  = lambda.value.source_dir
    output_path = lambda.value.output_path
}

resource "aws_lambda_function" "get_lambda" {
  for_each = {for lambda in var.lambda_list: lambda.function_name => lambda}
  filename         = lambda.value.filename
  function_name    = lambda.value.function_name
  role             = var.arn
  handler          = lambda.value.handler
  runtime          = var.runtime
  timeout          = var.timeout

  vpc_config {
    subnet_ids         = [
      var.value.sub_id_1, 
      var.sub_id_2
    ]
    security_group_ids = [
      var.sec_group_id
    ]
  }

  environment {
    variables = {
      TABLE_NAME = var.table_name
    }
  }

  tags = {
    Name = lambda.value.function_name
  }
}
