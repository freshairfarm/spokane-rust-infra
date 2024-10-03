locals {
  default_tags = var.default_tags
  name_prefix  = var.name_prefix

  bucket_name = "s3-${local.name_prefix}-${var.bucket_name}"
}

resource "aws_s3_bucket" "bucket" {
  bucket = local.bucket_name

  tags = merge(
    local.default_tags,
    { Name = local.bucket_name }
  )
}

resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.bucket.bucket
}
