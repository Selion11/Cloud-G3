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
    default = ["./resources/POST.py",
                "./resources/GET.py",
                "./resources/VERIFY.py"]
}

variable "handler"{
    type = list(string)
    default = ["POST.lambda_handler",
                "GET.lambda_handler",
                "VERIFY.lambda_handler"]
}