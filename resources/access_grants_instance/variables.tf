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

variable "identity_center_arn" {
  type        = string
  default     = null
  description = "(Optional) ARN of the IAM Identity Center instance associated with the S3 Access Grants instance."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A map of tags to assign to the resource."
}
