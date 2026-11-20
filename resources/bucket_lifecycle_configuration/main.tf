resource "aws_s3_bucket_lifecycle_configuration" "this" {
  region                                 = var.region
  bucket                                 = var.bucket
  expected_bucket_owner                  = var.expected_bucket_owner
  transition_default_minimum_object_size = var.transition_default_minimum_object_size

  dynamic "rule" {
    for_each = var.rule
    content {
      dynamic "abort_incomplete_multipart_upload" {
        for_each = rule.value.abort_incomplete_multipart_upload != null ? [rule.value.abort_incomplete_multipart_upload] : []
        content {
          days_after_initiation = lookup(abort_incomplete_multipart_upload.value, "days_after_initiation", null)
        }
      }

      dynamic "expiration" {
        for_each = rule.value.expiration != null ? [rule.value.expiration] : []
        content {
          date                         = lookup(expiration.value, "date", null)
          days                         = lookup(expiration.value, "days", null)
          expired_object_delete_marker = lookup(expiration.value, "expired_object_delete_marker", null)
        }
      }

      dynamic "filter" {
        for_each = rule.value.filter != null ? [rule.value.filter] : []
        content {
          dynamic "and" {
            for_each = filter.value.and != null ? [filter.value.and] : []
            content {
              object_size_greater_than = lookup(and.value, "object_size_greater_than", null)
              object_size_less_than    = lookup(and.value, "object_size_less_than", null)
              prefix                   = lookup(and.value, "prefix", null)

              tags = lookup(and.value, "tags", null)
            }
          }

          object_size_greater_than = lookup(filter.value, "object_size_greater_than", null)
          object_size_less_than    = lookup(filter.value, "object_size_less_than", null)
          prefix                   = lookup(filter.value, "prefix", null)

          dynamic "tag" {
            for_each = filter.value.tag != null ? filter.value.tag : []
            content {
              key   = tag.value.key
              value = tag.value.value
            }
          }
        }
      }

      id     = rule.value.id
      prefix = lookup(rule.value, "prefix", null)

      dynamic "noncurrent_version_expiration" {
        for_each = rule.value.noncurrent_version_expiration != null ? [rule.value.noncurrent_version_expiration] : []
        content {
          newer_noncurrent_versions = lookup(noncurrent_version_expiration.value, "newer_noncurrent_versions", null)
          noncurrent_days           = noncurrent_version_expiration.value.noncurrent_days
        }
      }

      dynamic "noncurrent_version_transition" {
        for_each = rule.value.noncurrent_version_transition != null ? rule.value.noncurrent_version_transition : []
        content {
          newer_noncurrent_versions = lookup(noncurrent_version_transition.value, "newer_noncurrent_versions", null)
          noncurrent_days           = noncurrent_version_transition.value.noncurrent_days
          storage_class             = noncurrent_version_transition.value.storage_class
        }
      }

      status = rule.value.status

      dynamic "transition" {
        for_each = rule.value.transition != null ? rule.value.transition : []
        content {
          date          = lookup(transition.value, "date", null)
          days          = lookup(transition.value, "days", null)
          storage_class = transition.value.storage_class
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      update = lookup(timeouts.value, "update", null)
    }
  }
}
