resource "aws_s3control_multi_region_access_point_policy" "this" {
  region     = var.region
  account_id = var.account_id

  details {
    name   = var.details.name
    policy = var.details.policy
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      update = lookup(timeouts.value, "update", null)
    }
  }
}
