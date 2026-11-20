variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "account_id" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) AWS account ID that owns the Multi-Region Access Point. Defaults to the account ID of the Terraform AWS provider."
}

variable "details" {
  type = object({
    name = string
    # (Required, Forces new resource) Name of the Multi-Region Access Point.
    public_access_block = optional(object({
      block_public_acls = optional(bool)
      # (Optional, Forces new resource) Whether to block public ACLs. Defaults to true.
      block_public_policy = optional(bool)
      # (Optional, Forces new resource) Whether to block public policies. Defaults to true.
      ignore_public_acls = optional(bool)
      # (Optional, Forces new resource) Whether to ignore public ACLs. Defaults to true.
      restrict_public_buckets = optional(bool)
      # (Optional, Forces new resource) Whether to restrict access through public policies. Defaults to true.
    }))

    region = set(object({
      bucket = string
      # (Required, Forces new resource) Name of the general purpose bucket associated with this Region.
      bucket_account_id = optional(string)
      # (Optional, Forces new resource) AWS account ID that owns the associated bucket.
    }))
    # (Required, Forces new resource) Set of 1 to 20 bucket associations.
  })
  description = "(Required, Forces new resource) Multi-Region Access Point name, public access settings, and associated buckets."
}

variable "timeouts" {
  type = object({
    create = optional(string)
    # (Optional) Timeout for creating the Multi-Region Access Point. Defaults to 60m.
    delete = optional(string)
    # (Optional) Timeout for deleting the Multi-Region Access Point. Defaults to 15m.
  })
  default     = null
  description = "(Optional) Timeout configuration for the Multi-Region Access Point."
}
