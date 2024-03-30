resource "aws_s3_bucket" "kamsi-bucket" {
  bucket = "kamsi-bucket"

  force_destroy       = true
  object_lock_enabled = true

  tags = {
    Name        = "main-back"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "kamsi-versioning" {
  bucket = aws_s3_bucket.kamsi-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "kamsi-bucket" {
  bucket = aws_s3_bucket.kamsi-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "kamsi-bucket-dynamodb-table" {
  name         = "kamsi-bucket-db-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
} 