# My Terraform Module

This module provisions a basic AWS infrastructure including EC2, VPC, and Key Pair.

## Usage

```hcl
module "my_module" {
  source = "github.com/mygithubusername/myterraformmodule"

  # Module variables
  instance_type = "t2.micro"
  region         = "us-east-1"
}

