#################################################################################
## This file initializes the variables required for creating infrastructure    ##
## We are hardcoding all the values, but in ideal way we can make it dynamic   ##
#################################################################################

#Initialize the base variables such as region, name for terraform backend
name   = "terraform-aws-example"
region = "us-east-1"

#Initialize all the Networking variables required - VPC
#In this architecture we spread across two availability zones for stronger infrastructure availability
vpc_azs                    = ["us-east-1a", "us-east-1b"]
vpc_cidr                   = "10.1.0.0/16"
vpc_private_subnets        = ["10.1.1.0/24", "10.1.2.0/24"]
vpc_public_subnets         = ["10.1.3.0/24", "10.1.4.0/24"]
vpc_enable_nat_gateway     = true
vpc_one_nat_gateway_per_az = true
vpc_single_nat_gateway     = false

#Initialize all the Compute variables required for worker and application clusters - EC2
