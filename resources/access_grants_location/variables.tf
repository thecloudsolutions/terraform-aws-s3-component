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

variable "iam_role_arn" {
  type        = string
  description = "(Required) ARN of the IAM role that S3 Access Grants assumes to provide access to the registered location."
}

variable "location_scope" {
  type        = string
  description = "(Required, Forces new resource) S3 URI of the registered location: s3://, a bucket, or a bucket prefix."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A map of tags to assign to the resource."
}
