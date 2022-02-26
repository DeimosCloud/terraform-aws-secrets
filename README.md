# Terraform AWS Secrets
A terraform module to create secrets on AWS


## Usage

```hcl
locals {
  secrets = {
    "/demo/database-credentials" = jsonencode({
      "user"     = "SomeUser"
      "password" = random_id.this.hex
      "host"     = random_id.this.id
      "name"     = "SomeDatabase"
    })
    token = "SomethingFishyGoingDown"
  }
}

module "secrets" {
  for_each = local.secrets
  source   = "."
  name     = each.key
  value    = each.value
  tags     = local.common_tags
}


```

## Contributing

Report issues/questions/feature requests on in the issues section.

Full contributing guidelines are covered [here](CONTRIBUTING.md).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0.0, > 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.74.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: /\_+=.@- | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) The labels assigned to this Secret | `map` | `{}` | no |
| <a name="input_value"></a> [value](#input\_value) | (Required) Specifies text data that you want to encrypt and store in this version of the secret. | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
