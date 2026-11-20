resource "aws_s3_bucket_abac" "this" {
  region                = var.region
  bucket                = var.bucket
  expected_bucket_owner = var.expected_bucket_owner

  abac_status {
    status = var.abac_status.status
  }
}
