variable "region" {
  type        = string
  default     = null
  description = "(Optional) Region where this resource will be managed. Defaults to the Region set in the provider configuration."
}

variable "bucket" {
  type        = string
  description = "(Required, Forces new resource) Name of the bucket."
}

variable "error_document" {
  type = object({
    key = string
    # (Required) Object key name to use when a 4XX class error occurs.
  })
  default     = null
  description = "(Optional, Conflicts with redirect_all_requests_to) Name of the error document for the website."
}

variable "expected_bucket_owner" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) Account ID of the expected bucket owner."
}

variable "index_document" {
  type = object({
    suffix = string
    # (Required) Suffix that is appended to a request that is for a directory on the website endpoint. For example, if the suffix is index.html and you make a request to samplebucket/images/, the data that is returned will be for the object with the key name images/index.html. The suffix must not be empty and must not include a slash character.
  })
  default     = null
  description = "(Optional, Required if redirect_all_requests_to is not specified) Name of the index document for the website. "
}

variable "redirect_all_requests_to" {
  type = object({
    host_name = string
    # (Required) Name of the host where requests are redirected.
    protocol = optional(string)
    # (Optional) Protocol to use when redirecting requests. The default is the protocol that is used in the original request. Valid values: http, https.
  })
  default     = null
  description = "(Optional, Required if index_document is not specified) Redirect behavior for every request to this bucket's website endpoint. See below. Conflicts with error_document, index_document, and routing_rule."
}

variable "routing_rule" {
  type = object({
    condition = optional(object({
      # (Optional) Configuration block for describing a condition that must be met for the specified redirect to apply.
      http_error_code_returned_equals = optional(number)
      # (Optional, Required if key_prefix_equals is not specified) HTTP error code when the redirect is applied. If specified with key_prefix_equals, then both must be true for the redirect to be applied.
      key_prefix_equals = optional(string)
      # (Optional, Required if http_error_code_returned_equals is not specified) Object key name prefix when the redirect is applied. If specified with http_error_code_returned_equals, then both must be true for the redirect to be applied.
    }))
    redirect = object({
      # (Required) Configuration block for redirect information.
      host_name = optional(string)
      # (Optional) Host name to use in the redirect request.
      http_redirect_code = optional(number)
      # (Optional) HTTP redirect code to use on the response.
      protocol = optional(string)
      # (Optional) Protocol to use when redirecting requests. The default is the protocol that is used in the original request. Valid values: http, https.
      replace_key_prefix_with = optional(string)
      # (Optional, Conflicts with replace_key_with) Object key prefix to use in the redirect request. For example, to redirect requests for all pages with prefix docs/ (objects in the docs/ folder) to documents/, you can set a condition block with key_prefix_equals set to docs/ and in the redirect set replace_key_prefix_with to /documents.
      replace_key_with = optional(string)
      # (Optional, Conflicts with replace_key_prefix_with) Specific object key to use in the redirect request. For example, redirect request to error.html.
    })
  })
  default     = null
  description = "(Optional, Conflicts with redirect_all_requests_to and routing_rules) List of rules that define when a redirect is applied and the redirect behavior."
}

variable "routing_rules" {
  type        = string
  default     = null
  description = "(Optional, Conflicts with routing_rule and redirect_all_requests_to) JSON array containing routing rules describing redirect behavior and when redirects are applied. Use this parameter when your routing rules contain empty String values ()"
}
