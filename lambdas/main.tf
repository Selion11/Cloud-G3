module "lambda_function_creator"{
    source = "./modules"
    lambda_function = [
        {
            function_name = var.lambda_names[0]
            description = var.lambda_descriptions[0]
            handler = var.handler[0]
            source_path = var.lambda_paths[0]
        },
        {
            function_name = var.lambda_names[1]
            description = var.lambda_descriptions[1]
            handler = var.handler[1]
            source_path = var.lambda_paths[1]
        },{
            function_name = var.lambda_names[2]
            description = var.lambda_descriptions[2]
            handler = var.handler[2]
            source_path = var.lambda_paths[2]
        }
    ]
}
