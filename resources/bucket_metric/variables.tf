variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required) Name of the bucket this metrics configuration is associated with."
}

variable "name" {
  type        = string
  description = "(Required) Unique identifier of the metrics configuration for the bucket. Must be less than or equal to 64 characters in length."
}

variable "filter" {
  type = object({
    access_point = optional(string)
    # (Optional) S3 Access Point ARN for filtering.
    prefix = optional(string)
    # (Optional) Object prefix for filtering.
    tags = optional(map(string))
    # (Optional) Object tags for filtering. Unsupported for S3 directory buckets.
  })
  default     = null
  description = "(Optional) Object filtering. At least one of access_point, prefix, or tags is required when specifying a filter."
}
