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

resource "aws_s3_object" "scripts.js"{
  key = var.code
  bucket = var.bucket_name
  source = var.code_path
}
