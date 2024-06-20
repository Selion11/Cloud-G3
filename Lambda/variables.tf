variable "lambda_list"{
    type = list(object({
        f_type = string
        function_name = string
        handler = string
        source_path = string
        source_dir = string
        output_path = string
        filename = string
        runtime = string
        timeout = number
        arn = string
        function_name = string
        sec_group_id = string
    }))
}

variable "subnet_ids" {
    type = list(object({
        id = string
    })
    description = "The IDs to place lambdas in"
}