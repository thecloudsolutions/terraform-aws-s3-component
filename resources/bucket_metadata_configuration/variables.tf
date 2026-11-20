variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required, Forces new resource) Name of the general purpose bucket to configure S3 Metadata for."
}

variable "expected_bucket_owner" {
  type        = string
  default     = null
  description = "(Optional, Deprecated, Forces new resource) Account ID of the expected bucket owner."
}

variable "metadata_configuration" {
  type = object({
    inventory_table_configuration = object({
      configuration_state = string
      # (Required) Whether the inventory table is enabled or disabled. Valid values are ENABLED and DISABLED.
      encryption_configuration = optional(object({
        kms_key_arn = optional(string)
        # (Optional) ARN of the KMS key when sse_algorithm is aws:kms.
        sse_algorithm = string
        # (Required) Encryption type. Valid values are aws:kms and AES256.
      }))
    })

    journal_table_configuration = object({
      encryption_configuration = optional(object({
        kms_key_arn = optional(string)
        # (Optional) ARN of the KMS key when sse_algorithm is aws:kms.
        sse_algorithm = string
        # (Required) Encryption type. Valid values are aws:kms and AES256.
      }))

      record_expiration = object({
        days = optional(number)
        # (Optional) Number of days to retain journal records. Must be at least 7 when specified.
        expiration = string
        # (Required) Whether journal record expiration is enabled or disabled. Valid values are ENABLED and DISABLED.
      })
    })
  })
  description = "(Required) Inventory and journal metadata table configuration."
}

variable "timeouts" {
  type = object({
    create = optional(string)
    # (Optional) Timeout for metadata configuration creation. Defaults to 30 minutes.
  })
  default     = null
  description = "(Optional) Configuration block for resource timeouts."
}
