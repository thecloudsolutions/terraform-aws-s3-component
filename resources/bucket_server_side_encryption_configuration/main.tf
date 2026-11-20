resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  region                = var.region
  bucket                = var.bucket
  expected_bucket_owner = var.expected_bucket_owner

  rule {
    dynamic "apply_server_side_encryption_by_default" {
      for_each = var.rule.apply_server_side_encryption_by_default != null ? [var.rule.apply_server_side_encryption_by_default] : []
      content {
        sse_algorithm     = apply_server_side_encryption_by_default.value.sse_algorithm
        kms_master_key_id = lookup(apply_server_side_encryption_by_default.value, "kms_master_key_id", null)
      }
    }

    blocked_encryption_types = lookup(var.rule, "blocked_encryption_types", null)
    bucket_key_enabled       = lookup(var.rule, "bucket_key_enabled", null)
  }
}
