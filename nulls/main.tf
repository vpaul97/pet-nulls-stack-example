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

variable "instances" {
  type = number
}

resource "null_resource" "this" {
  for_each = { for i in range(var.instances) : i => i }  # Create a map based on instances

  triggers = {
    pet   = var.pet
    index = each.key
  }
}

output "ids" {
  value = [for n in null_resource.this : n.id]
}

