variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required) Name of the source bucket that inventory lists the objects for."
}

variable "name" {
  type        = string
  description = "(Required) Unique identifier of the inventory configuration for the bucket."
}

variable "included_object_versions" {
  type        = string
  description = "(Required) Object versions to include in the inventory list. Valid values: All, Current."
}

variable "schedule" {
  type = object({
    frequency = string
    # (Required) Specifies how frequently inventory results are produced. Valid values: Daily, Weekly.
  })
  description = "(Required) Specifies the schedule for generating inventory results."
}

variable "destination" {
  type = object({
    bucket = object({
      bucket_arn = string
      # (Required) Amazon S3 bucket ARN of the destination.
      format = string
      # (Required) Specifies the output format of the inventory results. Can be CSV, ORC or Parquet.
      account_id = optional(string)
      # (Optional) ID of the account that owns the destination bucket. Recommended to be set to prevent problems if the destination bucket ownership changes.
      prefix = optional(string)
      # (Optional) Prefix that is prepended to all inventory results.

      encryption = optional(object({
        # (Optional) Contains the type of server-side encryption to use to encrypt the inventory.
        sse_kms = optional(object({
          # (Optional) Specifies to use server-side encryption with AWS KMS-managed keys to encrypt the inventory file.
          key_id = string
          # (Required) ARN of the KMS customer master key (CMK) used to encrypt the inventory file.
        }))

        sse_s3 = optional(object({}))
        # (Optional) Specifies to use server-side encryption with Amazon S3-managed keys (SSE-S3) to encrypt the inventory file.
      }))
    })
  })
  description = "(Required) Contains information about where to publish the inventory results."
}

variable "enabled" {
  type        = bool
  default     = null
  description = "(Optional, Default: true) Specifies whether the inventory is enabled or disabled."
}

variable "filter" {
  type = object({
    prefix = optional(string)
    # (Optional) Prefix that an object must have to be included in the inventory results.
  })
  default     = null
  description = "(Optional) Specifies an inventory filter. The inventory only includes objects that meet the filter's criteria."
}

variable "optional_fields" {
  type        = list(string)
  default     = null
  description = "(Optional) List of optional fields that are included in the inventory results."
}
