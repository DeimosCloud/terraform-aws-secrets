terraform {
  required_version = ">= 0.12.26"
}


resource "aws_secretsmanager_secret" "this" {
  name = var.name

  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = var.value
}
