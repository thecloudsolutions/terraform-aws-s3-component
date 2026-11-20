variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required, Forces new resource) Name of the general purpose S3 bucket."
}

variable "expected_bucket_owner" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource, Deprecated) Account ID of the expected bucket owner."
}

variable "abac_status" {
  type = object({
    status = string
    # (Required) ABAC status of the general purpose bucket. Valid values: Enabled or Disabled.
  })
  description = "(Required) Configuration block for Attribute Based Access Control."
}
