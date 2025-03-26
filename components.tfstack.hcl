# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "prefix" {
  type = string
}

variable "instances" {
  type = number
}

required_providers {
  random = {
    source  = "hashicorp/random"
    version = "~> 3.5.1"
  }

  null = {
    source  = "hashicorp/null"
    version = "~> 3.2.2"
  }
}

provider "random" "this" {}
provider "null" "this" {}

component "pet" {
  source = "./pet"

  inputs = {
    prefix = var.prefix
  }

  providers = {
    random = provider.random.this
  }
}

component "nulls" {
  source = "./nulls"
  for_each = tomap({
    g1 = 1
    g2 = 1
    g3 = 1
    g4 = 1
    g5 = 1
    g6 = 1
  })

  inputs = {
    pet       = component.pet.name
    instances = each.value
  }

  providers = {
    null = provider.null.this
  }
}

# removed {
#   source = "./nulls"
#
#   for_each = tomap({
#     g1 = 1
#     g2 = 1
#     # g3 = 1
#     # g4 = 1
#   })
#
#   from = component.nulls[each.key]
#   lifecycle {
#     destroy = true
#   }
#   providers = {
#     null = provider.null.this
#   }
#
# }
