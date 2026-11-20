variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required, Forces new resource) Name of the bucket."
}

variable "expected_bucket_owner" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Account ID of the expected bucket owner."
}

variable "target_bucket" {
  type        = string
  description = "(Required) Name of the bucket where you want Amazon S3 to store server access logs."
}

variable "target_grant" {
  type = set(object({
    grantee = object({
      # (Required) Configuration block for the person being granted permissions.
      email_address = optional(string)
      # (Optional) Email address of the grantee. See Regions and Endpoints for supported AWS regions where this argument can be specified.
      id = optional(string)
      # (Optional) Canonical user ID of the grantee.
      type = string
      # (Required) Type of grantee. Valid values: CanonicalUser, AmazonCustomerByEmail, Group.
      uri = optional(string)
      # (Optional) URI of the grantee group.
    })
    permission = string
    # (Required) Logging permissions assigned to the grantee for the bucket. Valid values: FULL_CONTROL, READ, WRITE.
  }))
  default     = null
  description = "(Optional) Set of configuration blocks with information for granting permissions."
}

variable "target_object_key_format" {
  type = object({
    partitioned_prefix = optional(object({
      partition_date_source = string
      # (Required) Source used to determine the date partition. Valid values are EventTime and DeliveryTime.
    }))
    simple_prefix = optional(object({}))
    # (Optional) Enables the simple S3 log object key format.
  })
  default     = null
  description = "(Optional) Amazon S3 key format for server access log objects."
}

variable "target_prefix" {
  type        = string
  description = "(Required) Prefix for all log object keys."
}
