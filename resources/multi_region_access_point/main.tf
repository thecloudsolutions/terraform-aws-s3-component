resource "aws_s3control_multi_region_access_point" "this" {
  region     = var.region
  account_id = var.account_id

  details {
    name = var.details.name

    dynamic "public_access_block" {
      for_each = var.details.public_access_block != null ? [var.details.public_access_block] : []
      content {
        block_public_acls       = lookup(public_access_block.value, "block_public_acls", null)
        block_public_policy     = lookup(public_access_block.value, "block_public_policy", null)
        ignore_public_acls      = lookup(public_access_block.value, "ignore_public_acls", null)
        restrict_public_buckets = lookup(public_access_block.value, "restrict_public_buckets", null)
      }
    }

    dynamic "region" {
      for_each = var.details.region
      content {
        bucket            = region.value.bucket
        bucket_account_id = lookup(region.value, "bucket_account_id", null)
      }
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }
}
