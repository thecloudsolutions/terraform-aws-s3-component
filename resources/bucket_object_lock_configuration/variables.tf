variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required, Forces new resource) Name of the bucket."
}

variable "expected_bucket_owner" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Account ID of the expected bucket owner."
}

variable "object_lock_enabled" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Indicates whether this bucket has an Object Lock configuration enabled. Defaults to Enabled. Valid values: Enabled.)"
}

variable "rule" {
  type = object({
    default_retention = object({
      # (Required) Configuration block for specifying the default Object Lock retention settings for new objects placed in the specified bucket.
      days = optional(number)
      # (Optional, Required if years is not specified) Number of days that you want to specify for the default retention period.
      mode = string
      # (Required) Default Object Lock retention mode you want to apply to new objects placed in the specified bucket. Valid values: COMPLIANCE, GOVERNANCE.
      years = optional(number)
      # (Optional, Required if days is not specified) Number of years that you want to specify for the default retention period.
    })
  })
  default     = null
  description = "(Optional) Configuration block for specifying the Object Lock rule for the specified object."
}

variable "token" {
  type        = string
  default     = null
  description = "(Optional) Token to allow Object Lock to be enabled for an existing bucket. You must contact AWS support for the bucket's Object Lock token. The token is generated in the back-end when versioning is enabled on a bucket. For more details on versioning, see the aws_s3_bucket_versioning resource."
}
