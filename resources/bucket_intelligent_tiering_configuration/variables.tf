variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required) Name of the bucket this intelligent tiering configuration is associated with."
}

variable "name" {
  type        = string
  description = "(Required) Unique name used to identify the S3 Intelligent-Tiering configuration for the bucket."
}

variable "status" {
  type        = string
  default     = null
  description = "(Optional) Status of the configuration. Valid values: Enabled, Disabled. Defaults to Enabled."
}

variable "filter" {
  type = object({
    prefix = optional(string)
    # (Optional) Object key name prefix that identifies the subset of objects to which the configuration applies.
    tags = optional(map(string))
    # (Optional) All of these tags must exist in the object's tag set for the configuration to apply.
  })
  default     = null
  description = "(Optional) Bucket filter. At least one of prefix or tags is required when specifying a filter."
}

variable "tiering" {
  type = set(object({
    access_tier = string
    # (Required) S3 Intelligent-Tiering access tier. Valid values: ARCHIVE_ACCESS, DEEP_ARCHIVE_ACCESS.
    days = number
    # (Required) Number of consecutive days of no access after which an object is eligible to transition to the corresponding tier.
  }))
  description = "(Required) S3 Intelligent-Tiering storage class tiers of the configuration."
}
