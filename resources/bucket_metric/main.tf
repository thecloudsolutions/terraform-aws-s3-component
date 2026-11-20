resource "aws_s3_bucket_metric" "this" {
  region = var.region
  bucket = var.bucket
  name   = var.name

  dynamic "filter" {
    for_each = var.filter != null ? [var.filter] : []
    content {
      access_point = lookup(filter.value, "access_point", null)
      prefix       = lookup(filter.value, "prefix", null)
      tags         = lookup(filter.value, "tags", null)
    }
  }
}
