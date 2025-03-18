# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

variable "pet" {
  type = string
}

variable "instance_id" {
  type = string
}

resource "null_resource" "this" {
  triggers = {
    pet         = var.pet
    instance_id = var.instance_id  # Unique per instance
  }
}

output "id" {
  value = null_resource.this.id
}

