terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }

  backend "s3" {
    bucket  = "co-cyber-security-external-state"
    key     = "terraform/state/account/576485064911/security_txt.tfstate"
    region  = "eu-west-2"
    profile = "co-cyber-security-external"
    encrypt = true
    }
}

provider "aws" {
  alias      = "main"
  region     = "eu-west-2"
  profile    = "co-cyber-security-external"
}

provider "aws" {
  alias      = "acm_provider"
  region     = "us-east-1"
  profile    = "co-cyber-security-external"
}
