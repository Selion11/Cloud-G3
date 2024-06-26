data "archive_file" "zip_post_lambda_code" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/lambda_post.zip"
}

resource "aws_lambda_function" "post_lambda" {
  filename         = "${path.module}/python/lambda_post.zip"
  function_name    = "PostVacunaFunction"
  role             = data.aws_iam_role.role.arn
  handler          = "lambda_post.lambda_handler"
  runtime          = "python3.12"
  timeout          = 10

  vpc_config {
    subnet_ids         = [
      aws_subnet.private_subnet_1.id, 
      aws_subnet.private_subnet_2.id
    ]
    security_group_ids = [
      data.aws_security_group.default.id
    ]
  }

  environment {
    variables = {
      TABLE_NAME = var.dynamodb_table_name
    }
  }

  tags = {
    Name = "PostVacunaFunction"
  }
}
