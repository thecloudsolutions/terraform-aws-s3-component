variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required) Name of the bucket this analytics configuration is associated with."
}

variable "name" {
  type        = string
  description = "(Required) Unique identifier of the analytics configuration for the bucket."
}

variable "filter" {
  type = object({
    prefix = optional(string)
    # (Optional) Object prefix for filtering.
    tags = optional(map(string))
    # (Optional) Set of object tags for filtering.
  })
  default     = null
  description = "(Optional) Object filtering that accepts a prefix, tags, or a logical AND of prefix and tags."
}

variable "storage_class_analysis" {
  type = object({
    data_export = object({
      # (Required) Data export configuration.
      output_schema_version = optional(string)
      # (Optional) Schema version of exported analytics data. Allowed values: V_1. Default value: V_1.

      destination = object({
        # (Required) Specifies the destination for the exported analytics data.

        s3_bucket_destination = object({
          # (Required) Analytics data export currently only supports an S3 bucket destination.
          bucket_arn = string
          # (Required) ARN of the destination bucket.
          bucket_account_id = optional(string)
          # (Optional) Account ID that owns the destination bucket.
          format = optional(string)
          # (Optional) Output format of exported analytics data. Allowed values: CSV. Default value: CSV.
          prefix = optional(string)
          # (Optional) Prefix to append to exported analytics data.
        })
      })
    })
  })
  default     = null
  description = "(Optional) Configuration for the analytics data export."
}
