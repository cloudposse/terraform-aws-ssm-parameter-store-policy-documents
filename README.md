
# terraform-aws-ssm-parameter-store-policy-documents
This module generates JSON documents for restricted permission sets for AWS SSM Parameter Store access.
Helpful when combined with [terraform-aws-ssm-parameter-store](https://github.com/cloudposse/terraform-aws-ssm-parameter-store) 

## Variables

| Name 								| Description 																																																														| Required 	|
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------|-----------|
| parameter_root_name | The prefix or root parameter that you want to allow access to 																																				  | No       	|
| kms_key 						| The arn of the KMS key that you want to allow access to. If empty it uses a wildcard resource. `*` 																			| No 				|
| region 							| The region of the parameter store value that you want to allow access to. If none supplied, it uses the current region of the provider. | No 				|
| account_id 					| The account id of the parameter store you want to allow access to. If none supplied, it uses the current account id of the provider. 		| No 				|

## Outputs

| Name  													| Description       																																							  |
|---------------------------------|---------------------------------------------------------------------------------------------------|
| read_parameter_store_policy 		| A JSON policy document that only allows read access to the parameter store  											|
| write_parameter_store_policy    | A JSON policy document that only allows write access to the parameter store 											|
| manage_kms_store_policy   			| A JSON policy document that allows decryption access to a KMS key           											|
| manage_parameter_store_policy 	| A JSON policy document that allows full access to the parameter store 		 											 	|
| put_xray_trace_policy 					| A JSON policy document that allows putting data into x-ray for tracing parameter store requests 	|

## Examples

### Create a policy that allows access to read all parameters

```hcl
module "ps_policy" {
	source = "git::https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents.git?ref=master"
}

resource "aws_iam_policy" "ps_read" {
  name_prefix   = "read_any_parameter_store_value"
  path   = "/"
  policy = "${module.ps_policy.read_parameter_store_policy}"
}
```

### Create a policy that allows access to write all parameters

```hcl
module "ps_policy" {
	source = "git::https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents.git?ref=master"
}

resource "aws_iam_policy" "ps_write" {
  name_prefix   = "write_any_parameter_store_value"
  path   = "/"
  policy = "${module.ps_policy.write_parameter_store_policy}"
}
```

### Create a policy that allows managing all policies
```hcl
module "ps_policy" {
	source = "git::https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents.git?ref=master"
}

resource "aws_iam_policy" "ps_manage" {
  name_prefix   = "manage_any_parameter_store_value"
  path   = "/"
  policy = "${module.ps_policy.manage_parameter_store_policy}"
}
```

### Create a policy that allows reading all parameters that start with a certain prefix
```hcl
module "ps_policy" {
	source 							= "git::https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents.git?ref=master"
	parameter_root_name = "/cp/dev/app"

}

resource "aws_iam_policy" "ps_manage" {
  name_prefix   = "write_specific_parameter_store_value"
  path   = "/"
  policy = "${module.ps_policy.manage_parameter_store_policy}"
}
```

### Create a kms policy to allow decrypting of the parameter store values
```hcl
module "kms_key" {
  source                  = "git::https://github.com/cloudposse/terraform-aws-kms-key.git?ref=master"
  namespace               = "cp"
  stage                   = "prod"
  name                    = "app"
  description             = "KMS key"
  deletion_window_in_days = 10
  enable_key_rotation     = "true"
  alias                   = "alias/parameter_store_key"
}

module "ps_policy" {
	source 							= "git::https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents.git?ref=master"
	parameter_root_name = "/cp/dev/app"
	kms_key 						= "${module.kms_key.key_arn}"

}

resource "aws_iam_policy" "ps_kms" {
  name_prefix   = "decrypt_parameter_store_value"
  path   = "/"
  policy = "${module.ps_policy.manage_kms_store_policy}"
}
```

### Create a policy for another account, or region
```hcl
module "ps_policy" {
	source 							= "git::https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents.git?ref=master"
	parameter_root_name = "/cp/dev/app"
	account_id          = "783649272629220"
	region 							= "ap-southeast-2"

}

resource "aws_iam_policy" "ps_manage" {
  name_prefix   = "manage_any_parameter_store_value"
  path   = "/"
  policy = "${module.ps_policy.manage_parameter_store_policy}"
}
```