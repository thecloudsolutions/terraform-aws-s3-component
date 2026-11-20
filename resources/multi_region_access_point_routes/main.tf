resource "aws_s3control_multi_region_access_point_routes" "this" {
  region     = var.region
  account_id = var.account_id
  mrap       = var.mrap

  dynamic "route" {
    for_each = var.route
    content {
      bucket                  = route.value.bucket
      region                  = route.value.region
      traffic_dial_percentage = route.value.traffic_dial_percentage
    }
  }
}
