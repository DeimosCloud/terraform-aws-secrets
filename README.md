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
| terraform | >= 0.12.26 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | (Required) Specifies the friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: /\_+=.@- | `any` | n/a | yes |
| tags | (Optional) The labels assigned to this Secret | `map` | `{}` | no |
| value | (Required) Specifies text data that you want to encrypt and store in this version of the secret. | `any` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
