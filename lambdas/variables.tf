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