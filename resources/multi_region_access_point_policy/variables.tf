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
    policy = string
    # (Required) JSON policy for the Multi-Region Access Point. Once applied, the policy can be updated but not deleted.
  })
  description = "(Required) Multi-Region Access Point name and access policy."
}

variable "timeouts" {
  type = object({
    create = optional(string)
    # (Optional) Timeout for creating the policy. Defaults to 15m.
    update = optional(string)
    # (Optional) Timeout for updating the policy. Defaults to 15m.
  })
  default     = null
  description = "(Optional) Timeout configuration for the Multi-Region Access Point policy."
}
