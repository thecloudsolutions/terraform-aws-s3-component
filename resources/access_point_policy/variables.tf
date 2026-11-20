variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "access_point_arn" {
  type        = string
  description = "(Required, Forces new resource) ARN of the access point associated with the policy."
}

variable "policy" {
  type        = string
  description = "(Required) JSON policy for the access point. Do not configure together with an inline policy on the same access point."
}
