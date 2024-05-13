#### VPC AND SUBNETS
 module "vpc-create"{
  source = "./vpc"
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

#### S3 BUCKET

resource "aws_s3_bucket" "vacunatorio_bucket" {
  bucket = var.bucket_name
  acl    = "private"
  tags = {
    name = var.bucket_name
  }

  versioning {
    enabled = false
  }
}

resource "aws_s3_object" "vacunatorio_frontend"{
  key = var.file_name
  bucket = var.bucket_name
  source = var.file_path
}

resource "aws_s3_object" "scripts"{
  key = var.code
  bucket = var.bucket_name
  source = var.code_path
}


#### LAMBDAS
module "lambda_function_creator"{
    source = "./lambdas"
    lambda_function = [
        {
            function_name = var.lambda_names[0]
            description = var.lambda_descriptions[0]
            handler = var.handler[0]
            source_path = var.lambda_paths[0]
        },
        {
            function_name = var.lambda_names[1]
            description = var.lambda_descriptions[1]
            handler = var.handler[1]
            source_path = var.lambda_paths[1]
        },{
            function_name = var.lambda_names[2]
            description = var.lambda_descriptions[2]
            handler = var.handler[2]
            source_path = var.lambda_paths[2]
        }
    ]
}
