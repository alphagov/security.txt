terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }

  backend "s3" {
    bucket  = "gds-security-terraform"
    key     = "terraform/state/account/103495720024/security_txt.tfstate"
    region  = "eu-west-2"
    profile = "cst-test"
    encrypt = true
    }
}

provider "aws" {
  alias      = "main"
  region     = "eu-west-2"
  profile    = "cst-test"
}

provider "aws" {
  alias      = "acm_provider"
  region     = "us-east-1"
  profile    = "cst-test"
}
