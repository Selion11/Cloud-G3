 module "vpc"{
  source = "./modules"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  subnets = [
    {
      cidr_block = "10.0.1.0/24"
      availability_zone = data.available.availability_zones[0]
      name = "private-lamda-subnet1"
      public = false
    }, {
      cidr_block = "10.0.2.0/24"
      availability_zone = data.available.availability_zones[1]
      name = "private-lamda-subnet2"
      public = false
    }
    ]
 }
