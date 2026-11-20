variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "acl" {
  type        = string
  default     = null
  description = "(Optional, Conflicts with access_control_policy) Canned ACL to apply to the bucket."
}

variable "access_control_policy" {
  type = object({
    grant = list(object({
      # (Required) Set of grant configuration blocks.
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
      # (Required) Logging permissions assigned to the grantee for the bucket.
    }))

    owner = object({
      # (Required) Configuration block of the bucket owner's display name and ID.
      id = string
      # (Required) ID of the owner.
      display_name = optional(string)
      # (Optional) Display name of the owner.
    })
  })
  default     = null
  description = "(Optional, Conflicts with acl) Configuration block that sets the ACL permissions for an object per grantee. "
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
