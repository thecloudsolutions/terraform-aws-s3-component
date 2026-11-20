resource "aws_s3_bucket_object_lock_configuration" "this" {
  region                = var.region
  bucket                = var.bucket
  expected_bucket_owner = var.expected_bucket_owner
  object_lock_enabled   = var.object_lock_enabled
  token                 = var.token

  dynamic "rule" {
    for_each = var.rule != null ? [var.rule] : []
    content {
      default_retention {
        days  = lookup(rule.value.default_retention, "days", null)
        mode  = rule.value.default_retention.mode
        years = lookup(rule.value.default_retention, "years", null)
      }
    }
  }
}
