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

data "aws_iam_policy_document" "s3_public_access" {
  statement {
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_S3_bucket_policy" "s3_public_access" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.s3_public_access.json
}
