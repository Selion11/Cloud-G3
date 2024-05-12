output "lambda_endpoints" {
  value = lambda_function.lambda[*].lambda_function_url
  description = "The the URL of the lambda functions created in the VPC"
}