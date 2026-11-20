resource "aws_s3_bucket_inventory" "this" {
  region                   = var.region
  bucket                   = var.bucket
  name                     = var.name
  included_object_versions = var.included_object_versions
  enabled                  = var.enabled
  optional_fields          = var.optional_fields

  schedule {
    frequency = var.schedule.frequency
  }

  destination {
    bucket {
      bucket_arn = var.destination.bucket.bucket_arn
      format     = var.destination.bucket.format
      account_id = lookup(var.destination.bucket, "account_id", null)
      prefix     = lookup(var.destination.bucket, "prefix", null)

      dynamic "encryption" {
        for_each = var.destination.bucket.encryption != null ? [var.destination.bucket.encryption] : []
        content {
          dynamic "sse_kms" {
            for_each = encryption.value.sse_kms != null ? [encryption.value.sse_kms] : []
            content {
              key_id = sse_kms.value.key_id
            }
          }

          dynamic "sse_s3" {
            for_each = encryption.value.sse_s3 != null ? [1] : []
            content {}
          }
        }
      }
    }
  }

  dynamic "filter" {
    for_each = var.filter != null ? [var.filter] : []
    content {
      prefix = lookup(filter.value, "prefix", null)
    }
  }
}
