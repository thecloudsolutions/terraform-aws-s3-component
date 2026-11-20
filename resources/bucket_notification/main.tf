resource "aws_s3_bucket_notification" "this" {
  region      = var.region
  bucket      = var.bucket
  eventbridge = var.eventbridge

  dynamic "lambda_function" {
    for_each = var.lambda_function != null ? var.lambda_function : []
    content {
      events              = lambda_function.value.events
      filter_prefix       = lookup(lambda_function.value, "filter_prefix", null)
      filter_suffix       = lookup(lambda_function.value, "filter_suffix", null)
      id                  = lookup(lambda_function.value, "id", null)
      lambda_function_arn = lookup(lambda_function.value, "lambda_function_arn", null)
    }
  }

  dynamic "queue" {
    for_each = var.queue != null ? var.queue : []
    content {
      events        = queue.value.events
      filter_prefix = lookup(queue.value, "filter_prefix", null)
      filter_suffix = lookup(queue.value, "filter_suffix", null)
      id            = lookup(queue.value, "id", null)
      queue_arn     = queue.value.queue_arn
    }
  }

  dynamic "topic" {
    for_each = var.topic != null ? var.topic : []
    content {
      events        = topic.value.events
      filter_prefix = lookup(topic.value, "filter_prefix", null)
      filter_suffix = lookup(topic.value, "filter_suffix", null)
      id            = lookup(topic.value, "id", null)
      topic_arn     = topic.value.topic_arn
    }
  }
}
