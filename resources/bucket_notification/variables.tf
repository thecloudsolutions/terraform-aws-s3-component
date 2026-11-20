variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required, Forces new resource) Name of the bucket for notification configuration."
}

variable "eventbridge" {
  type        = bool
  default     = null
  description = "(Optional) Whether to enable Amazon EventBridge notifications. Defaults to false."
}

variable "lambda_function" {
  type = list(object({
    events = set(string)
    # (Required) Events for which to send notifications.
    filter_prefix = optional(string)
    # (Optional) Object key name prefix.
    filter_suffix = optional(string)
    # (Optional) Object key name suffix.
    id = optional(string)
    # (Optional) Unique identifier for the notification configuration.
    lambda_function_arn = optional(string)
    # (Optional) Lambda function ARN.
  }))
  default     = null
  description = "(Optional) List of notification configurations for Lambda functions."
}

variable "queue" {
  type = list(object({
    events = set(string)
    # (Required) Events for which to send notifications.
    filter_prefix = optional(string)
    # (Optional) Object key name prefix.
    filter_suffix = optional(string)
    # (Optional) Object key name suffix.
    id = optional(string)
    # (Optional) Unique identifier for the notification configuration.
    queue_arn = string
    # (Required) SQS queue ARN.
  }))
  default     = null
  description = "(Optional) List of notification configurations for SQS queues."
}

variable "topic" {
  type = list(object({
    events = set(string)
    # (Required) Events for which to send notifications.
    filter_prefix = optional(string)
    # (Optional) Object key name prefix.
    filter_suffix = optional(string)
    # (Optional) Object key name suffix.
    id = optional(string)
    # (Optional) Unique identifier for the notification configuration.
    topic_arn = string
    # (Required) SNS topic ARN.
  }))
  default     = null
  description = "(Optional) List of notification configurations for SNS topics."
}
