resource "lambda_function_creator" {

    for_each = {for lambda in var.lambda_function: lambda.function_name => lambda}

    function_name = each.value.function_name
    description   = each.value.description
    handler       = each.value.handler
    source_path = each.value.source_path

    tags = {
        Name = each.value.function_name
    }
  
    for_each = {for id  in var.subnet_ids: id => id}
    vpc.subnet_ids = each.value.id
    vpc.security_group_ids = each.value.security_group_id

}



/*data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda.js"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.test"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "nodejs18.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}