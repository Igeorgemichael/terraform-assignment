# terraform should install version 5.0 or higher 
terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }
}

# lets hardcode the region
provider "aws" {
  region = "eu-central-1"
  profile = "default"
}
