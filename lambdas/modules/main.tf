module "lambda_function_creator" {

    source = "terraform-aws-modules/lambda/aws"
    runtime = "python3.12"
    attach_policy = true
    policy = data.LabRole.arn

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



/*module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  # ...omitted for brevity

  allowed_triggers = {
    Config = {
      principal        = "config.amazonaws.com"
      principal_org_id = "o-abcdefghij"
    }
    APIGatewayAny = {
      service    = "apigateway"
      source_arn = "arn:aws:execute-api:eu-west-1:135367859851:aqnku8akd0/*/*/*"
    },
    APIGatewayDevPost = {
      service    = "apigateway"
      source_arn = "arn:aws:execute-api:eu-west-1:135367859851:aqnku8akd0/dev/POST/*"
    },
    OneRule = {
      principal  = "events.amazonaws.com"
      source_arn = "arn:aws:events:eu-west-1:135367859851:rule/RunDaily"
    }
  }}*/
