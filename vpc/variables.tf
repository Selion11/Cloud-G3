variable "vpc_cidr"{
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_name"{
    type = string
    default = "vacunatorio-VPC"
}

variable "subnets"{
    type = list(object({
        cidr_block = string
        availability_zone = string
        name = string
        public = bool
    }))
}