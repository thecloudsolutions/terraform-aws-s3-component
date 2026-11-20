variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "account_id" {
  type        = string
  description = "(Required, Forces new resource) AWS account ID that owns the access point."
}

variable "name" {
  type        = string
  description = "(Required, Forces new resource) Name of the directory bucket access point."
}

variable "scope" {
  type = object({
    permissions = optional(list(string))
    # (Optional) API operations allowed through the access point.
    prefixes = optional(list(string))
    # (Optional) Object prefixes allowed through the access point.
  })
  description = "(Required) Scope of the directory bucket access point. Set permissions and prefixes to empty lists to clear the restrictions."
}
