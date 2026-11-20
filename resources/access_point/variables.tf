variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required, Forces new resource) Name of the general purpose or directory bucket, or ARN of the S3 on Outposts bucket associated with the access point."
}

variable "name" {
  type        = string
  description = "(Required, Forces new resource) Name of the access point."
}

variable "account_id" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) AWS account ID that owns the access point. Defaults to the account ID of the Terraform AWS provider."
}

variable "bucket_account_id" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) AWS account ID associated with the bucket."
}

variable "policy" {
  type        = string
  default     = null
  description = "(Optional) JSON policy for the access point. Do not configure together with a standalone access point policy for the same access point. Set to an empty JSON document to remove an inline policy."
}

variable "public_access_block_configuration" {
  type = object({
    block_public_acls = optional(bool)
    # (Optional, Forces new resource) Whether to block public ACLs. Defaults to true.
    block_public_policy = optional(bool)
    # (Optional, Forces new resource) Whether to block public policies. Defaults to true.
    ignore_public_acls = optional(bool)
    # (Optional, Forces new resource) Whether to ignore public ACLs. Defaults to true.
    restrict_public_buckets = optional(bool)
    # (Optional, Forces new resource) Whether to restrict access through public policies. Defaults to true.
  })
  default     = null
  description = "(Optional, Forces new resource) Public access block configuration for the access point."
}

variable "vpc_configuration" {
  type = object({
    vpc_id = string
    # (Required, Forces new resource) VPC ID from which the access point allows connections.
  })
  default     = null
  description = "(Optional, Forces new resource) Restricts access to requests from the specified VPC. Required for S3 on Outposts."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A map of tags assigned to the access point."
}
