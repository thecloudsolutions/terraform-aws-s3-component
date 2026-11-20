resource "aws_s3_bucket" "this" {
  region              = var.region
  bucket              = var.bucket
  bucket_namespace    = var.bucket_namespace
  bucket_prefix       = var.bucket_prefix
  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled

  tags = var.tags
}
