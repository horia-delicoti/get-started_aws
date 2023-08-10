resource "aws_amplify_app" "front_app" {
  name         = "WebApp"
  repository   = "https://github.com/horia-delicoti/get-started_aws"
  access_token = var.access_token

  enable_auto_branch_creation = true
  enable_branch_auto_deletion = true
  auto_branch_creation_config {
    enable_auto_build = true
  }

  platform = "WEB"

  build_spec = <<EOF
    version: 1
    applications:
      - frontend:
          phases:
            build:
              commands: []
          artifacts:
            baseDirectory: /
            files:
              - '**/*'
          cache:
            paths: []
        appRoot: basic_web_application
  EOF

  # custom_rule {
  #   source = "/<*>"
  #   status = "404"
  #   target = "content/index.html"
  # }

  environment_variables = {
    ENV = "test"
  }
}

resource "aws_amplify_branch" "develop" {
  app_id            = aws_amplify_app.front_app.id
  branch_name       = "main"
  stage             = "PRODUCTION"
  enable_auto_build = true
}
