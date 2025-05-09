# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# deployment "simple" {
#   inputs = {
#     prefix           = "simple"
#     instances        = 1
#   }
# }

deployment "complex" {
  inputs = {
    prefix           = "complex"
    instances        = 3
  }
  destroy = true
}

deployment "complex2" {
  inputs = {
    prefix           = "complex2"
    instances        = 3
  }
}

deployment "complex3" {
  inputs = {
    prefix           = "complex3"
    instances        = 3
  }
}
