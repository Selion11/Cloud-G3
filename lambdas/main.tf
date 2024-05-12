module "lambda_function_creator"{
    source = "./modules"
    lambda_function = [
        {
            function_name = var.lambda_names[0]
            description = var.lambda_descriptions[0]
            handler = "lambda1.handler"
            source_path = "lambdas/lambda1"
        },
        {
            function_name = "lambda2"
            description = "lambda2"
            handler = "lambda2.handler"
            source_path = "lambdas/lambda2"
        }
    ]
}
