terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "beryjuorg"

    workspaces {
      name = "infrastructure"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.38.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.10.0"
    }
  }
}

provider "vault" {
}

data "vault_generic_secret" "aws" {
  path = "kv/aws/terraform"
}

provider "aws" {
  region     = "eu-central-1"
  access_key = data.vault_generic_secret.aws.data["access_key"]
  secret_key = data.vault_generic_secret.aws.data["secret_key"]
}

module "guacamole" {
  source = "./guacamole/"
}
module "authentik" {
  source = "./authentik/"
}
module "aws" {
  source = "./aws/"
}
module "aws_ses_forwarder" {
  source = "./aws_ses_forwarder/"
}
module "grafana" {
  source = "./grafana/"
}
module "vault" {
  source = "./vault/"
}
module "k8s" {
  source = "./k8s/"
}
module "oci" {
  source = "./oci/"
}
module "symbiosis" {
  source = "./symbiosis/"
}
