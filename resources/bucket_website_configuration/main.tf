resource "aws_s3_bucket_website_configuration" "this" {
  region                = var.region
  bucket                = var.bucket
  expected_bucket_owner = var.expected_bucket_owner
  routing_rules         = var.routing_rules

  dynamic "error_document" {
    for_each = var.error_document != null ? [var.error_document] : []
    content {
      key = error_document.value.key
    }
  }

  dynamic "index_document" {
    for_each = var.index_document != null ? [var.index_document] : []
    content {
      suffix = index_document.value.suffix
    }
  }

  dynamic "redirect_all_requests_to" {
    for_each = var.redirect_all_requests_to != null ? [var.redirect_all_requests_to] : []
    content {
      host_name = redirect_all_requests_to.value.host_name
      protocol  = lookup(redirect_all_requests_to.value, "protocol", null)
    }
  }

  dynamic "routing_rule" {
    for_each = var.routing_rule != null ? [var.routing_rule] : []
    content {
      dynamic "condition" {
        for_each = routing_rule.value.condition != null ? [routing_rule.value.condition] : []
        content {
          http_error_code_returned_equals = lookup(condition.value, "http_error_code_returned_equals", null)
          key_prefix_equals               = lookup(condition.value, "key_prefix_equals", null)
        }
      }
      redirect {
        host_name               = lookup(routing_rule.value.redirect, "host_name", null)
        http_redirect_code      = lookup(routing_rule.value.redirect, "http_redirect_code", null)
        protocol                = lookup(routing_rule.value.redirect, "protocol", null)
        replace_key_prefix_with = lookup(routing_rule.value.redirect, "replace_key_prefix_with", null)
        replace_key_with        = lookup(routing_rule.value.redirect, "replace_key_with", null)
      }
    }
  }
}
