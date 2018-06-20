
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| account_id | The account id of the parameter store you want to allow access to. If none supplied, it uses the current account id of the provider. | string | `` | no |
| kms_key | The arn of the KMS key that you want to allow access to. If empty it uses a wildcard resource. `*` | string | `` | no |
| parameter_root_name | The prefix or root parameter that you want to allow access to | string | `` | no |
| region | The region of the parameter store value that you want to allow access to. If none supplied, it uses the current region of the provider. | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| manage_kms_store_policy | A JSON policy document that allows decryption access to a KMS key |
| manage_parameter_store_policy | A JSON policy document that allows full access to the parameter store |
| put_xray_trace_policy | A JSON policy document that allows putting data into x-ray for tracing parameter store requests |
| read_parameter_store_policy | A JSON policy document that only allows read access to the parameter store |
| write_parameter_store_policy | A JSON policy document that only allows write access to the parameter store |

