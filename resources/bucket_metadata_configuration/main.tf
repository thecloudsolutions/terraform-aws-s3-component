resource "aws_s3_bucket_metadata_configuration" "this" {
  region                = var.region
  bucket                = var.bucket
  expected_bucket_owner = var.expected_bucket_owner

  metadata_configuration {
    inventory_table_configuration {
      configuration_state = var.metadata_configuration.inventory_table_configuration.configuration_state

      dynamic "encryption_configuration" {
        for_each = var.metadata_configuration.inventory_table_configuration.encryption_configuration != null ? [var.metadata_configuration.inventory_table_configuration.encryption_configuration] : []
        content {
          kms_key_arn   = lookup(encryption_configuration.value, "kms_key_arn", null)
          sse_algorithm = encryption_configuration.value.sse_algorithm
        }
      }
    }

    journal_table_configuration {
      dynamic "encryption_configuration" {
        for_each = var.metadata_configuration.journal_table_configuration.encryption_configuration != null ? [var.metadata_configuration.journal_table_configuration.encryption_configuration] : []
        content {
          kms_key_arn   = lookup(encryption_configuration.value, "kms_key_arn", null)
          sse_algorithm = encryption_configuration.value.sse_algorithm
        }
      }

      record_expiration {
        days       = lookup(var.metadata_configuration.journal_table_configuration.record_expiration, "days", null)
        expiration = var.metadata_configuration.journal_table_configuration.record_expiration.expiration
      }
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
    }
  }
}
