<!-- BEGIN_TF_DOCS -->
![nventive](https://nventive-public-assets.s3.amazonaws.com/nventive_logo_github.svg?v=2)

# terraform-aws-lb

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=flat-square)](LICENSE) [![Latest Release](https://img.shields.io/github/release/nventive/terraform-aws-lb.svg?style=flat-square)](https://github.com/nventive/terraform-aws-lb/releases/latest)

Terraform module to provision an Application, Network or Gateway Load Balancer.

---

## Examples

**IMPORTANT:** We do not pin modules to versions in our examples because of the difficulty of keeping the versions in
the documentation in sync with the latest released versions. We highly recommend that in your code you pin the version
to the exact version you are using so that your infrastructure remains stable, and update versions in a systematic way
so that they do not catch you by surprise.

```hcl
module "alb" {
  source = "nventive/lb/aws"
  # We recommend pinning every module to a specific version
  # version = "x.x.x"

  namespace = "eg"
  stage     = "test"
  name      = "app"

  load_balancer_type = "application"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.9 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.9 |
| <a name="provider_null"></a> [null](#provider\_null) | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_access_logs"></a> [access\_logs](#module\_access\_logs) | cloudposse/lb-s3-bucket/aws | 0.19.0 |
| <a name="module_sg"></a> [sg](#module\_sg) | cloudposse/security-group/aws | 2.2.0 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_lb.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [null_resource.sg_vpc_validation](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs_enabled"></a> [access\_logs\_enabled](#input\_access\_logs\_enabled) | Whether or not ALB access logs should be enabled. | `bool` | `true` | no |
| <a name="input_access_logs_force_destroy"></a> [access\_logs\_force\_destroy](#input\_access\_logs\_force\_destroy) | Set to `true` to force access logs bucket. | `bool` | `false` | no |
| <a name="input_access_logs_prefix"></a> [access\_logs\_prefix](#input\_access\_logs\_prefix) | Prefix for ALB access logs. | `string` | `""` | no |
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. | `bool` | `false` | no |
| <a name="input_enable_http2"></a> [enable\_http2](#input\_enable\_http2) | Indicates whether HTTP/2 is enabled in `application` load balancers. | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | The time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type `application`. | `number` | `60` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | Set to `true`, to create an internal Load Balancer. | `bool` | `false` | no |
| <a name="input_ip_address_type"></a> [ip\_address\_type](#input\_ip\_address\_type) | Address type for ALB possible. Specify one of `ipv4`, `dualstack`. | `string` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | Type of the Load Balancer. Specify one of `application`, `network` or `gateway`. | `string` | `"application"` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_security_group_enabled"></a> [security\_group\_enabled](#input\_security\_group\_enabled) | Set to `true` to create a self-referencing security group for all ports. | `bool` | `false` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security group IDS to associate with the Load Balancer. | `list(string)` | `[]` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the Load Balancer. The Load Balancer will be created in the VPC associated with the subnet IDs. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC. Required if `security_group_enabled` is `true`. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_logs_bucket_arn"></a> [access\_logs\_bucket\_arn](#output\_access\_logs\_bucket\_arn) | Access Logs S3 bucket ARN. |
| <a name="output_access_logs_bucket_domain_name"></a> [access\_logs\_bucket\_domain\_name](#output\_access\_logs\_bucket\_domain\_name) | Access Logs S3 bucket domain name. |
| <a name="output_access_logs_bucket_id"></a> [access\_logs\_bucket\_id](#output\_access\_logs\_bucket\_id) | Access Logs S3 bucket ID. |
| <a name="output_access_logs_bucket_prefix"></a> [access\_logs\_bucket\_prefix](#output\_access\_logs\_bucket\_prefix) | Access Logs S3 bucket prefix. |
| <a name="output_access_logs_enabled"></a> [access\_logs\_enabled](#output\_access\_logs\_enabled) | Are Access Logs enabled. |
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the load balancer (matches `id`). |
| <a name="output_arn_suffix"></a> [arn\_suffix](#output\_arn\_suffix) | The ARN suffix for use with CloudWatch Metrics. |
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | The DNS name of the load balancer. |
| <a name="output_enabled"></a> [enabled](#output\_enabled) | Is the module enabled. |
| <a name="output_id"></a> [id](#output\_id) | The ARN of the load balancer (matches `arn`). |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | ID for the default security if `security_group_enabled` is `true`. |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record). |

## Breaking Changes

Please consult [BREAKING\_CHANGES.md](BREAKING\_CHANGES.md) for more information about version
history and compatibility.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on the process for
contributing to this project.

Be mindful of our [Code of Conduct](CODE\_OF\_CONDUCT.md).

## We're hiring

Look for current openings on BambooHR https://nventive.bamboohr.com/careers/

## Stay in touch

[nventive.com](https://nventive.com/) | [Linkedin](https://www.linkedin.com/company/nventive/) | [Instagram](https://www.instagram.com/hellonventive/) | [YouTube](https://www.youtube.com/channel/UCFQyvGEKMO10hEyvCqprp5w) | [Spotify](https://open.spotify.com/show/0lsxfIb6Ttm76jB4wgutob)
<!-- END_TF_DOCS -->