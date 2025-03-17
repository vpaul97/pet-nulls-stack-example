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
  type        = map(string)
  default     = {
    resource1 = "First resource"
    resource2 = "Second resource"
    resource3 = "Third resource"
  }
}

variable "instances" {
  type = number
}

resource "null_resource" "this" {
  for_each = var.pet

  # count = var.instances

  triggers = {
    pet = each.value
  }
}

output "ids" {
  value = [for n in null_resource.this: n.id]
}
