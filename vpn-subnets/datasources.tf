data "aws_availability_zones" "available" {
    state = "available"
}

data "aws_iam_role" "role" {
    name = "LabRole"
}