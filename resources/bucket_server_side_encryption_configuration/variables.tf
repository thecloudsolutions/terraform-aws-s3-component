variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required, Forces new resource) ID (name) of the bucket."
}

variable "expected_bucket_owner" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Account ID of the expected bucket owner.)"
}

variable "rule" {
  type = object({
    apply_server_side_encryption_by_default = optional(object({
      # (Optional) Single object for setting server-side encryption by default.
      sse_algorithm = string
      # (Required) Server-side encryption algorithm to use. Valid values are AES256 and aws:kms
      kms_master_key_id = optional(string)
      # (Optional) AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse_algorithm as aws:kms. The default aws/s3 AWS KM
    }))
    blocked_encryption_types = optional(list(string))
    # (Optional) Server-side encryption types to block for object uploads.
    bucket_key_enabled = optional(bool)
    # (Optional) Whether or not to use Amazon S3 Bucket Keys for SSE-KMS.
  })
  description = "(Required) Set of server-side encryption configuration rules. See below. Currently, only a single rule is supported."
}
