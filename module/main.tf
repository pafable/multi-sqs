terraform {
  required_version = ">= 1.0.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

resource "aws_sqs_queue" "tf_sqs_multi" {
  name             = var.name
  delay_seconds    = 90
  max_message_size = 2048
  tags             = var.default_tags
}