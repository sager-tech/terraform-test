provider "aws" {
  region = "us-east-1"
}

locals {
  env = "plat-ops-staging"
  name = "spin-terraform-platops-staging-bucket-demo"
}

resource "aws_s3_bucket" "bucket" {
  bucket = local.name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Environment = local.env
  }
}

