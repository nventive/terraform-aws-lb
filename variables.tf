variable "load_balancer_type" {
  type        = string
  default     = "application"
  description = "Type of the Load Balancer. Specify one of `application`, `network` or `gateway`."
  validation {
    condition     = var.load_balancer_type == "application" || var.load_balancer_type == "network" || var.load_balancer_type == "gateway"
    error_message = "The `load_balancer_type` must be either `application`, `network` or `gateway`."
  }
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "ID of the VPC. Required if `security_group_enabled` is `true`."
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "List of subnet IDs for the Load Balancer. The Load Balancer will be created in the VPC associated with the subnet IDs."
}

variable "ip_address_type" {
  type        = string
  default     = null
  description = "Address type for ALB possible. Specify one of `ipv4`, `dualstack`."
}

variable "enable_deletion_protection" {
  type        = bool
  default     = false
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer."
}

variable "enable_http2" {
  type        = bool
  default     = false
  description = "Indicates whether HTTP/2 is enabled in `application` load balancers."
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "Security group IDS to associate with the Load Balancer."
}

variable "access_logs_prefix" {
  type        = string
  default     = ""
  description = "Prefix for ALB access logs."
}

variable "access_logs_enabled" {
  type        = bool
  default     = true
  description = "Whether or not ALB access logs should be enabled."
}

variable "access_logs_force_destroy" {
  type        = bool
  default     = false
  description = "Set to `true` to force access logs bucket."
}

variable "security_group_enabled" {
  type        = bool
  default     = false
  description = "Set to `true` to create a self-referencing security group for all ports."
}

variable "idle_timeout" {
  type        = number
  default     = 60
  description = "The time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type `application`."
}

variable "internal" {
  type        = bool
  default     = false
  description = "Set to `true`, to create an internal Load Balancer."
}
