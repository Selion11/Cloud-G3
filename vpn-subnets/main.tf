 module "vpc"{
  source = "./modules"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  subnets = [
    {
      cidr_block = "10.0.1.0/24"
      availability_zone = "us-east-1a"
      name = "private-lamda-subnet1"
      public = false
    }, {
      cidr_block = "10.0.2.0/24"
      availability_zone = "us-east-1b"
      name = "private-lamda-subnet2"
      public = false
    }
    ]
 }
