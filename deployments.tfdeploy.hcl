# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

deployment "simple" {
  inputs = {
    prefix           = "simple"
    instances        = 1
  }
}

deployment "complex" {
  inputs = {
    environments     = ["red","blue"]
    prefix           = "complex"
    instances        = 3
  }
}
