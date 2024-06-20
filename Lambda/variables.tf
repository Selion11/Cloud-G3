variable "lambda_list"{
    type = list(object({
        function_name = string
        handler = string
        source_dir = string
        output_path = string
        filename = string
    }))
}
variable "f_type"{
    type = string
}

variable "arn"{
    type = string
}

variable "runtime"{
    type = string
    default = "python3.12"
}

variable "timeout"{
    type = number
    default = 10
}

variable "table_name"{
    type = string
}

variable "sub_id_1"{
    type = string
}
variable "sub_id_2"{
    type = string
}

variable "sec_group_id"{
    type = string
}