# Create iam policy
data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

# Create iam execution role
resource "aws_iam_role" "lambda_role" {
  name               = "HelloWorld_function_role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

# Create the archive file from lambda_function
data "archive_file" "python_lambda_package" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "lamba_function.zip"
}

resource "aws_lambda_function" "test_lambda_function" {
  function_name    = "HelloWorldFunction"
  filename         = "lamba_function.zip"
  source_code_hash = data.archive_file.python_lambda_package.output_base64sha256
  role             = aws_iam_role.lambda_role.arn
  runtime          = "python3.11"
  handler          = "lambda_function.lambda_handler"
  timeout          = 10
}
