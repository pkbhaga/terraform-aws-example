// setup backend for storing terraform state in AWS S3 and Dynamo for locking
terraform {
  required_version = "~> 0.13"

  backend "s3" {
    bucket  = "terraform-aws-admin-state"
    key     = "v1/terraform-aws-admin-state-example"
    region  = "us-east-1"
    encrypt = true

    dynamodb_table = "terraform-aws-admin-state-lock"
  }
}
