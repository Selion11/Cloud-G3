module "lambdas-create"{
    source = "./Lambda"
    runtime = "python3.12"
    timeout = 10
    table_name = aws_dynamodb_table.vacuna_table.name
    sub_id_1 = aws_subnet.private_subnet_1.id
    sub_id_2 = aws_subnet.private_subnet_2.id   
    arn  = data.aws_iam_role.role.arn
    f_type = "zip"
    sec_group_id = data.aws_security_group.default.id
    lambda_list = [
        {
            function_name = "PostVacunaFunction"
            handler = "lambda_post.lambda_handler"
            source_dir = "${path.module}/resources/"
            output_path = "${path.module}/resources/lambda_post.zip"
            filename = "${path.module}/resources/lambda_post.zip"
        },
        {
            function_name = "GetVacunaFunction"
            handler = "lambda_get.lambda_handler"
            source_dir = "${path.module}/resources/"
            output_path = "${path.module}/resources/lambda_get.zip"
            filename = "${path.module}/resources/lambda_get.zip"
        }
    ]
}