# This uses Terraform to configure the resources required for remote state
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-aws-admin-state"
}

resource "aws_dynamodb_table" "terraform_state" {
  name           = "terraform-aws-admin-state-lock"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}

resource "null_resource" "sleep" {
  provisioner "local-exec" {
    command = "sleep 10"
  }
}

