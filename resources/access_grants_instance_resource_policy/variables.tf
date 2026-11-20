variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "account_id" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) AWS account ID of the S3 Access Grants instance. Defaults to the account ID of the Terraform AWS provider."
}

variable "policy" {
  type        = string
  description = "(Required) JSON resource policy for the S3 Access Grants instance."
}
