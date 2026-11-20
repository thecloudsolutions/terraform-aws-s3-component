resource "aws_s3_bucket_analytics_configuration" "this" {
  region = var.region
  bucket = var.bucket
  name   = var.name

  dynamic "filter" {
    for_each = var.filter != null ? [var.filter] : []
    content {
      prefix = lookup(filter.value, "prefix", null)
      tags   = lookup(filter.value, "tags", null)
    }
  }

  dynamic "storage_class_analysis" {
    for_each = var.storage_class_analysis != null ? [var.storage_class_analysis] : []
    content {
      data_export {
        output_schema_version = lookup(storage_class_analysis.value.data_export, "output_schema_version", null)

        destination {

          s3_bucket_destination {
            bucket_arn        = storage_class_analysis.value.data_export.destination.s3_bucket_destination.bucket_arn
            bucket_account_id = lookup(storage_class_analysis.value.data_export.destination.s3_bucket_destination, "bucket_account_id", null)
            format            = lookup(storage_class_analysis.value.data_export.destination.s3_bucket_destination, "format", null)
            prefix            = lookup(storage_class_analysis.value.data_export.destination.s3_bucket_destination, "prefix", null)
          }
        }
      }
    }
  }
}
