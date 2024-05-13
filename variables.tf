#### VPC AND SUBNETS
variable "vpc_cidr"{
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_name"{
    type = string
    default = "vacunatorio-VPC"
}


#### S3 BUCKET
variable "bucket_name"{
    type = string
    default = "vacunatorio-bucket"
}

variable "file_name"{
    type = string
    default = "vacunas_front.html"
}

variable "code"{
    type = string
    defailt = "scripts.js"
}

variable "file_path"{
    type = string
    default = "../resources/index.html"
}

variable "visibility"{
    type = string
    default = "public-read"
}

variable "code_path"{
    type = string
    default = "../resources/scripts.js"
}


#### LAMBDAS
variable "lambda_names"{
    type = list(string)
    default = ["Post", "Get","Verify"]
}

variable "lambda_descriptions"{
    type = list(string)
    default = [ "Postear una vacuna a la database",
                "Obtener los datos de un usuario o tipo de vacuna almacenado en la database",
                "Verificar si los datos ingresados por el usuario son correctos"]
}

variable "lambda_paths"{
    type = list(string)
    default = ["../resources/POST.py",
                "../resources/GET.py",
                "../resources/VERIFY.py"]
}

variable "handler"{
    type = list(string)
    default = ["POST.lambda_handler",
                "GET.lambda_handler",
                "VERIFY.lambda_handler"]
}