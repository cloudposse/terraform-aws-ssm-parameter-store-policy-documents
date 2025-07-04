

<!-- markdownlint-disable -->
<a href="https://cpco.io/homepage"><img src="https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents/blob/main/.github/banner.png?raw=true" alt="Project Banner"/></a><br/>
    <p align="right">
<a href="https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents/releases/latest"><img src="https://img.shields.io/github/release/cloudposse/terraform-aws-ssm-parameter-store-policy-documents.svg?style=for-the-badge" alt="Latest Release"/></a><a href="https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents/commits"><img src="https://img.shields.io/github/last-commit/cloudposse/terraform-aws-ssm-parameter-store-policy-documents.svg?style=for-the-badge" alt="Last Updated"/></a><a href="https://cloudposse.com/slack"><img src="https://slack.cloudposse.com/for-the-badge.svg" alt="Slack Community"/></a></p>
<!-- markdownlint-restore -->

<!--




  ** DO NOT EDIT THIS FILE
  **
  ** This file was automatically generated by the `cloudposse/build-harness`.
  ** 1) Make all changes to `README.yaml`
  ** 2) Run `make init` (you only need to do this once)
  ** 3) Run`make readme` to rebuild this file.
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **





-->

This module generates JSON documents for restricted permission sets for AWS SSM Parameter Store access.
Helpful when combined with [terraform-aws-ssm-parameter-store](https://github.com/cloudposse/terraform-aws-ssm-parameter-store)


> [!TIP]
> #### 👽 Use Atmos with Terraform
> Cloud Posse uses [`atmos`](https://atmos.tools) to easily orchestrate multiple environments using Terraform. <br/>
> Works with [Github Actions](https://atmos.tools/integrations/github-actions/), [Atlantis](https://atmos.tools/integrations/atlantis), or [Spacelift](https://atmos.tools/integrations/spacelift).
>
> <details>
> <summary><strong>Watch demo of using Atmos with Terraform</strong></summary>
> <img src="https://github.com/cloudposse/atmos/blob/main/docs/demo.gif?raw=true"/><br/>
> <i>Example of running <a href="https://atmos.tools"><code>atmos</code></a> to manage infrastructure from our <a href="https://atmos.tools/quick-start/">Quick Start</a> tutorial.</i>
> </detalis>







## Examples

Create a policy that allows access to write all parameters
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

Create a policy that allows managing all policies
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

Create a policy that allows reading all parameters that start with a certain prefix
```hcl
module "ps_policy" {
  source              = "git::https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents.git?ref=master"
  parameter_root_name = "/cp/dev/app"

}

resource "aws_iam_policy" "ps_manage" {
  name_prefix   = "write_specific_parameter_store_value"
  path   = "/"
  policy = "${module.ps_policy.manage_parameter_store_policy}"
}
```

Create a kms policy to allow decrypting of the parameter store values
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
  source              = "git::https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents.git?ref=master"
  parameter_root_name = "/cp/dev/app"
  kms_key             = "${module.kms_key.key_arn}"

}

resource "aws_iam_policy" "ps_kms" {
  name_prefix   = "decrypt_parameter_store_value"
  path   = "/"
  policy = "${module.ps_policy.manage_kms_store_policy}"
}
```

Create a policy for another account, or region
```hcl
module "ps_policy" {
  source              = "git::https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents.git?ref=master"
  parameter_root_name = "/cp/dev/app"
  account_id          = "783649272629220"
  region              = "ap-southeast-2"

}

resource "aws_iam_policy" "ps_manage" {
  name_prefix   = "manage_any_parameter_store_value"
  path   = "/"
  policy = "${module.ps_policy.manage_parameter_store_policy}"
}
```

> [!TIP]
> #### Use Terraform Reference Architectures for AWS
>
> Use Cloud Posse's ready-to-go [terraform architecture blueprints](https://cloudposse.com/reference-architecture/) for AWS to get up and running quickly.
>
> ✅ We build it together with your team.<br/>
> ✅ Your team owns everything.<br/>
> ✅ 100% Open Source and backed by fanatical support.<br/>
>
> <a href="https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-parameter-store-policy-documents&utm_content=commercial_support"><img alt="Request Quote" src="https://img.shields.io/badge/request%20quote-success.svg?style=for-the-badge"/></a>
> <details><summary>📚 <strong>Learn More</strong></summary>
>
> <br/>
>
> Cloud Posse is the leading [**DevOps Accelerator**](https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-parameter-store-policy-documents&utm_content=commercial_support) for funded startups and enterprises.
>
> *Your team can operate like a pro today.*
>
> Ensure that your team succeeds by using Cloud Posse's proven process and turnkey blueprints. Plus, we stick around until you succeed.
> #### Day-0:  Your Foundation for Success
> - **Reference Architecture.** You'll get everything you need from the ground up built using 100% infrastructure as code.
> - **Deployment Strategy.** Adopt a proven deployment strategy with GitHub Actions, enabling automated, repeatable, and reliable software releases.
> - **Site Reliability Engineering.** Gain total visibility into your applications and services with Datadog, ensuring high availability and performance.
> - **Security Baseline.** Establish a secure environment from the start, with built-in governance, accountability, and comprehensive audit logs, safeguarding your operations.
> - **GitOps.** Empower your team to manage infrastructure changes confidently and efficiently through Pull Requests, leveraging the full power of GitHub Actions.
>
> <a href="https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-parameter-store-policy-documents&utm_content=commercial_support"><img alt="Request Quote" src="https://img.shields.io/badge/request%20quote-success.svg?style=for-the-badge"/></a>
>
> #### Day-2: Your Operational Mastery
> - **Training.** Equip your team with the knowledge and skills to confidently manage the infrastructure, ensuring long-term success and self-sufficiency.
> - **Support.** Benefit from a seamless communication over Slack with our experts, ensuring you have the support you need, whenever you need it.
> - **Troubleshooting.** Access expert assistance to quickly resolve any operational challenges, minimizing downtime and maintaining business continuity.
> - **Code Reviews.** Enhance your team’s code quality with our expert feedback, fostering continuous improvement and collaboration.
> - **Bug Fixes.** Rely on our team to troubleshoot and resolve any issues, ensuring your systems run smoothly.
> - **Migration Assistance.** Accelerate your migration process with our dedicated support, minimizing disruption and speeding up time-to-value.
> - **Customer Workshops.** Engage with our team in weekly workshops, gaining insights and strategies to continuously improve and innovate.
>
> <a href="https://cpco.io/commercial-support?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-parameter-store-policy-documents&utm_content=commercial_support"><img alt="Request Quote" src="https://img.shields.io/badge/request%20quote-success.svg?style=for-the-badge"/></a>
> </details>



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







## Related Projects

Check out these related projects.

- [terraform-aws-ssm-parameter-store](https://github.com/cloudposse/terraform-aws-ssm-parameter-store) - Terraform module to populate AWS Systems Manager (SSM) Parameter Store with values from Terraform. Works great with Chamber.
- [terraform-aws-ssm-iam-role](https://github.com/cloudposse/terraform-aws-ssm-iam-role) - Terraform module to provision an IAM role with configurable permissions to access SSM Parameter Store
- [terraform-aws-kms-key](https://github.com/cloudposse/terraform-aws-kms-key) - Terraform module to provision a KMS key with alias



## ✨ Contributing

This project is under active development, and we encourage contributions from our community.



Many thanks to our outstanding contributors:

<a href="https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=cloudposse/terraform-aws-ssm-parameter-store-policy-documents&max=24" />
</a>

For 🐛 bug reports & feature requests, please use the [issue tracker](https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents/issues).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.
 1. Review our [Code of Conduct](https://github.com/cloudposse/terraform-aws-ssm-parameter-store-policy-documents/?tab=coc-ov-file#code-of-conduct) and [Contributor Guidelines](https://github.com/cloudposse/.github/blob/main/CONTRIBUTING.md).
 2. **Fork** the repo on GitHub
 3. **Clone** the project to your own machine
 4. **Commit** changes to your own branch
 5. **Push** your work back up to your fork
 6. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!

### 🌎 Slack Community

Join our [Open Source Community](https://cpco.io/slack?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-parameter-store-policy-documents&utm_content=slack) on Slack. It's **FREE** for everyone! Our "SweetOps" community is where you get to talk with others who share a similar vision for how to rollout and manage infrastructure. This is the best place to talk shop, ask questions, solicit feedback, and work together as a community to build totally *sweet* infrastructure.

### 📰 Newsletter

Sign up for [our newsletter](https://cpco.io/newsletter?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-parameter-store-policy-documents&utm_content=newsletter) and join 3,000+ DevOps engineers, CTOs, and founders who get insider access to the latest DevOps trends, so you can always stay in the know.
Dropped straight into your Inbox every week — and usually a 5-minute read.

### 📆 Office Hours <a href="https://cloudposse.com/office-hours?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-parameter-store-policy-documents&utm_content=office_hours"><img src="https://img.cloudposse.com/fit-in/200x200/https://cloudposse.com/wp-content/uploads/2019/08/Powered-by-Zoom.png" align="right" /></a>

[Join us every Wednesday via Zoom](https://cloudposse.com/office-hours?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-parameter-store-policy-documents&utm_content=office_hours) for your weekly dose of insider DevOps trends, AWS news and Terraform insights, all sourced from our SweetOps community, plus a _live Q&A_ that you can’t find anywhere else.
It's **FREE** for everyone!
## License

<a href="https://opensource.org/licenses/Apache-2.0"><img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg?style=for-the-badge" alt="License"></a>

<details>
<summary>Preamble to the Apache License, Version 2.0</summary>
<br/>
<br/>

Complete license is available in the [`LICENSE`](LICENSE) file.

```text
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
```
</details>

## Trademarks

All other trademarks referenced herein are the property of their respective owners.


---
Copyright © 2017-2025 [Cloud Posse, LLC](https://cpco.io/copyright)


<a href="https://cloudposse.com/readme/footer/link?utm_source=github&utm_medium=readme&utm_campaign=cloudposse/terraform-aws-ssm-parameter-store-policy-documents&utm_content=readme_footer_link"><img alt="README footer" src="https://cloudposse.com/readme/footer/img"/></a>

<img alt="Beacon" width="0" src="https://ga-beacon.cloudposse.com/UA-76589703-4/cloudposse/terraform-aws-ssm-parameter-store-policy-documents?pixel&cs=github&cm=readme&an=terraform-aws-ssm-parameter-store-policy-documents"/>
