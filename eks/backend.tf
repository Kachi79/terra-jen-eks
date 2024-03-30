terraform {
  backend "s3" {
    bucket         = "kosi-bucket9"
    key            = "eks/S3/terraform.tfvars"
    region         = "eu-west-2"
    dynamodb_table = "kosi-bucket-db-table"
    encrypt        = true
  }
}