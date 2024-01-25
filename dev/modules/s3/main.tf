resource "aws_s3_bucket" "tfstate-bucket" {
  bucket = "terraform-s3-bucket"
}

resource "aws_s3_bucket_versioning" "tfstate-versioning" {
  bucket = aws_s3_bucket.tfstate-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
