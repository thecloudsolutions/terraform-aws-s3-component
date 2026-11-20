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

variable "access_grants_location_id" {
  type        = string
  description = "(Required, Forces new resource) ID of the registered S3 Access Grants location."
}

variable "permission" {
  type        = string
  description = "(Required, Forces new resource) Access level for the grant. Valid values: READ, WRITE, READWRITE."
}

variable "s3_prefix_type" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Set to Object when the grant applies to a single object."
}

variable "access_grants_location_configuration" {
  type = object({
    s3_sub_prefix = optional(string)
    # (Optional, Forces new resource) Sub-prefix that narrows the registered location scope.
  })
  default     = null
  description = "(Optional, Forces new resource) Configuration for narrowing the registered location scope."
}

variable "grantee" {
  type = object({
    grantee_identifier = string
    # (Required, Forces new resource) ARN of an IAM user or role, or ID of an IAM Identity Center user or group.
    grantee_type = string
    # (Required, Forces new resource) Type of grantee. Valid values: IAM, DIRECTORY_USER, DIRECTORY_GROUP.
  })
  description = "(Required, Forces new resource) Identity receiving access to the registered location."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A map of tags to assign to the resource."
}
