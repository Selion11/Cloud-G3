variable "lambda_function"{
    type = list(object({
        function_name = string
        description = string
        handler = string
        source_path = string
    }))
}

varuable "subnet_ids" {
    type = list(object({
        id = string
        security_group_id = string
    })
    description = "The IDs to place lambdas in"
}