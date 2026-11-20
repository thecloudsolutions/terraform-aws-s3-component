resource "aws_s3_bucket_logging" "this" {
  region                = var.region
  bucket                = var.bucket
  expected_bucket_owner = var.expected_bucket_owner
  target_bucket         = var.target_bucket

  dynamic "target_grant" {
    for_each = var.target_grant != null ? var.target_grant : []
    content {
      grantee {
        email_address = lookup(target_grant.value.grantee, "email_address", null)
        id            = lookup(target_grant.value.grantee, "id", null)
        type          = target_grant.value.grantee.type
        uri           = lookup(target_grant.value.grantee, "uri", null)
      }

      permission = target_grant.value.permission
    }
  }

  dynamic "target_object_key_format" {
    for_each = var.target_object_key_format != null ? [var.target_object_key_format] : []
    content {
      dynamic "partitioned_prefix" {
        for_each = lookup(target_object_key_format.value, "partitioned_prefix", null) != null ? [target_object_key_format.value.partitioned_prefix] : []
        content {
          partition_date_source = partitioned_prefix.value.partition_date_source
        }
      }

      dynamic "simple_prefix" {
        for_each = lookup(target_object_key_format.value, "simple_prefix", null) != null ? [target_object_key_format.value.simple_prefix] : []
        content {}
      }
    }
  }

  target_prefix = var.target_prefix
}
