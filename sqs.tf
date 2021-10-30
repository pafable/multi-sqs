terraform {
  required_version = ">= 1.0.6"
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

variable "workspace_iam_roles" {
  type = map(string)
}

variable "name" {
  type = string
  default = "multi-sqs"
}

# ================
# Providers
# ================
provider "aws" {
  region = "eu-central-1"
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }
  alias = "euc1"
}

provider "aws" {
  region = "eu-west-1"
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }
  alias = "euw1"
}

provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }
  alias = "use1"
}

provider "aws" {
  region = "us-east-2"
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }
  alias = "use2"
}

provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }
  alias = "usw2"
}

provider "aws" {
  region = "ca-central-1"
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }
  alias = "cac1"
}

# ================
# Modules
# ================
module "multi_sqs_euc1" {
  source = "./module"
  name = "${var.name}-euc1"
  providers = {
    aws = aws.euc1
  }
}

module "multi_sqs_euw1" {
  source = "./module"
  name = "${var.name}-euw1"
  providers = {
    aws = aws.euw1
  }
}

module "multi_sqs_use1" {
  source = "./module"
  name = "${var.name}-use1"
  providers = {
    aws = aws.use1
  }
}

module "multi_sqs_use2" {
  source = "./module"
  name = "${var.name}-use2"
  providers = {
    aws = aws.use2
  }
}

module "multi_sqs_usw2" {
  source = "./module"
  name = "${var.name}-usw2"
  providers = {
    aws = aws.usw2
  }
}

module "multi_sqs_cac1" {
  source = "./module"
  name = "${var.name}-cac1"
  providers = {
    aws = aws.cac1
  }
}
