<!-- markdownlint-disable -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.manage_kms_store](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.manage_parameter_store](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.put_xray_trace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.read_parameter_store](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.write_parameter_store](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The account id of the parameter store you want to allow access to. If none supplied, it uses the current account id of the provider. | `string` | `""` | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | The arn of the KMS key that you want to allow access to. If empty it uses a wildcard resource (`*`). | `string` | `""` | no |
| <a name="input_parameter_root_name"></a> [parameter\_root\_name](#input\_parameter\_root\_name) | The prefix or root parameter that you want to allow access to. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | The region of the parameter store value that you want to allow access to. If none supplied, it uses the current region of the provider. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_manage_kms_store_policy"></a> [manage\_kms\_store\_policy](#output\_manage\_kms\_store\_policy) | A JSON policy document that allows decryption access to a KMS key. |
| <a name="output_manage_parameter_store_policy"></a> [manage\_parameter\_store\_policy](#output\_manage\_parameter\_store\_policy) | A JSON policy document that allows full access to the parameter store. |
| <a name="output_put_xray_trace_policy"></a> [put\_xray\_trace\_policy](#output\_put\_xray\_trace\_policy) | A JSON policy document that allows putting data into x-ray for tracing parameter store requests. |
| <a name="output_read_parameter_store_policy"></a> [read\_parameter\_store\_policy](#output\_read\_parameter\_store\_policy) | A JSON policy document that only allows read access to the parameter store. |
| <a name="output_write_parameter_store_policy"></a> [write\_parameter\_store\_policy](#output\_write\_parameter\_store\_policy) | A JSON policy document that only allows write access to the parameter store. |
<!-- markdownlint-restore -->
