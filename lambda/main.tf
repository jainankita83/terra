provider "aws" {

    region = "${var.aws_region}"
  
}

provider "archive" {}


data "archive_file" "zip" {
  type = "zip"
  source_file = "hello_lambda.js"
  output_path = "hello_lambda.zip"
}



resource "aws_lambda_function" "lambda" {
  function_name = "hello_lambda"

  filename = "${data.archive_file.zip.output_path}"
  source_code_hash = "${data.archive_file.zip.output_base64sha256}"

  role = "${var.role}"
  handler = "hello_lambda.handler"
  runtime = "nodejs8.10"

  # environment {
  #   variables = {
  #     greeting = "Welcome to Harness Terraform Lambda Demo"
  #   }
  # }
}