locals {
  enabled                    = module.this.enabled
  security_group_ids         = concat(var.security_group_ids, var.security_group_enabled ? [module.sg.id] : [])
  security_group_name_suffix = "ecs-alb-self-ref"
  security_group_name        = "${module.this.id}-${local.security_group_name_suffix}"
}

resource "aws_lb" "default" {
  count = local.enabled ? 1 : 0

  name               = module.this.id
  subnets            = var.subnet_ids
  ip_address_type    = var.ip_address_type
  idle_timeout       = var.idle_timeout
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  enable_http2       = var.enable_http2
  security_groups    = local.security_group_ids

  enable_deletion_protection = var.enable_deletion_protection

  access_logs {
    bucket  = module.access_logs.bucket_id
    prefix  = var.access_logs_prefix
    enabled = var.access_logs_enabled
  }

  tags = module.this.tags
}

module "access_logs" {
  source  = "cloudposse/lb-s3-bucket/aws"
  version = "0.19.0"

  enabled       = var.access_logs_enabled && local.enabled
  force_destroy = var.access_logs_force_destroy

  attributes = compact(concat(module.this.attributes, ["lb", "access", "logs"]))
  context    = module.this.context
}

module "sg" {
  source  = "cloudposse/security-group/aws"
  version = "2.2.0"

  enabled = var.security_group_enabled && local.enabled

  name                       = local.security_group_name_suffix
  vpc_id                     = var.vpc_id
  allow_all_egress           = true
  create_before_destroy      = true
  preserve_security_group_id = true

  rules = [{
    type        = "ingress"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = []
    self        = true
    description = "Allow ingress from self-referencing security group"
  }]

  depends_on = [null_resource.sg_vpc_validation]

  context = module.this.context

  tags = merge(module.this.tags, {
    Name = local.security_group_name
  })
}

resource "null_resource" "sg_vpc_validation" {
  lifecycle {
    precondition {
      condition     = !(local.enabled && var.security_group_enabled && var.vpc_id == null)
      error_message = "The VPC ID is required when `security_group_enabled` is `true`."
    }
  }
}
