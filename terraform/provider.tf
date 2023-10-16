terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.21.0"
    }
  }
}

# Configure AWS provider:

provider "aws" {
  region  = "eu-north-1"
}

terraform {
  backend "s3" {
    bucket = "notbad-tf-state"
    key = "terraform.tfstate"
    region = "eu-north-1"
  }
}