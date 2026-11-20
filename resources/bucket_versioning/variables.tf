variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required, Forces new resource) Name of the S3 bucket."
}

variable "versioning_configuration" {
  type = object({
    status = string
    # (Required) Versioning state of the bucket. Valid values: Enabled, Suspended, or Disabled. Disabled should only be used when creating or importing resources that correspond to unversioned S3 buckets.)
    mfa_delete = optional(string)
    # (Optional) Specifies whether MFA delete is enabled in the bucket versioning configuration. Valid values: Enabled or Disabled.
  })
  description = "(Required) Configuration block for the versioning parameters. See below."
}

variable "expected_bucket_owner" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Account ID of the expected bucket owner."
}

variable "mfa" {
  type        = string
  default     = null
  description = "(Optional, Required if versioning_configuration mfa_delete is enabled) Concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device."
}
