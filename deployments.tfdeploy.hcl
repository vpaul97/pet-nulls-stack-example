# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

deployment "simple1" {
  inputs = {
    prefix           = "simple"
    instances        = 1
  }
  destroy = false
}

deployment "complex" {
  inputs = {
    prefix           = "complex"
    instances        = 3
  }
}

deployment "complex2" {
  inputs = {
    prefix           = "complex2"
    instances        = 2
  }
}
