terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.8"
    }
  }
  backend "s3" {
    bucket         = "anikamoments140224"
    key            = "hire/node-app/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
