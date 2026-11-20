resource "aws_s3_bucket_accelerate_configuration" "this" {
  region                = var.region
  bucket                = var.bucket
  expected_bucket_owner = var.expected_bucket_owner
  status                = var.status
}
