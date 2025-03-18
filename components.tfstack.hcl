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
  for_each = toset([1, 2, 3, 4])

  inputs = {
    pet       = component.pet.name
    instances = each.key
  }

  providers = {
    null = provider.null.this
  }
}
