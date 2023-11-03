output "enabled" {
  value       = local.enabled
  description = "Is the module enabled."
}

output "id" {
  value       = join("", aws_lb.default.*.id)
  description = "The ARN of the load balancer (matches `arn`)."
}

output "arn" {
  value       = join("", aws_lb.default.*.arn)
  description = "The ARN of the load balancer (matches `id`)."
}

output "arn_suffix" {
  value       = join("", aws_lb.default.*.arn_suffix)
  description = "The ARN suffix for use with CloudWatch Metrics."
}

output "dns_name" {
  value       = join("", aws_lb.default.*.dns_name)
  description = "The DNS name of the load balancer."
}

output "zone_id" {
  value       = join("", aws_lb.default.*.zone_id)
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)."
}

output "security_group_id" {
  value       = module.sg.id
  description = "ID for the default security if `security_group_enabled` is `true`."
}

output "access_logs_bucket_domain_name" {
  value       = module.access_logs.bucket_domain_name
  description = "Access Logs S3 bucket domain name."
}

output "access_logs_bucket_id" {
  value       = module.access_logs.bucket_id
  description = "Access Logs S3 bucket ID."
}

output "access_logs_bucket_arn" {
  value       = module.access_logs.bucket_arn
  description = "Access Logs S3 bucket ARN."
}

output "access_logs_bucket_prefix" {
  value       = module.access_logs.bucket_prefix
  description = "Access Logs S3 bucket prefix."
}

output "access_logs_enabled" {
  value       = module.access_logs.enabled
  description = "Are Access Logs enabled."
}
