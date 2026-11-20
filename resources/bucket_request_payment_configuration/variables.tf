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
  description = "(Optional, Deprecated, Forces new resource) Account ID of the expected bucket owner."
}

variable "payer" {
  type        = string
  description = "(Required) Who pays for the download and request fees. Valid values are BucketOwner and Requester."
}
