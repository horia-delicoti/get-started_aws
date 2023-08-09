# Get started with AWS using Terraform

Build, change and destory AWS infrastrucutre using Terraform.

## Prerequisite

- [Homebrew][homebrew]
- [Git][git]
- [AWS cli][aws_cli]
- [AWS account][aws_account]
- [Terraform cli][terraform_cli]

## Getting started

Set the environment variables to authenticate the AWS provider

```sh
export AWS_ACCESS_KEY_ID=<key_id>
export AWS_SECRET_ACCESS_KEY=<access_key>
```

Initialize the project

```sh
terraform init
```

Provision the EC2 instrance with `apply`

```sh
terraform apply
```

To terminated the EC2 instance, run:

```sh
terraform destroy
```

<!-- Link labels: -->
[terraform_cli]: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
[git]: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
[aws_cli]: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
[homebrew]: https://brew.sh
[aws_account]: https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all
