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

variable "mrap" {
  type        = string
  description = "(Required, Forces new resource) ARN of the Multi-Region Access Point."
}

variable "route" {
  type = set(object({
    bucket = string
    # (Required) Name of the associated bucket.
    region = string
    # (Required) AWS Region where the bucket is located.
    traffic_dial_percentage = number
    # (Required) Routing status: 0 for passive or 100 for active. At least one route must be active.
  }))
  description = "(Required) Routing configuration for the Multi-Region Access Point. Removing this resource from Terraform does not reset the configured routes."
}
