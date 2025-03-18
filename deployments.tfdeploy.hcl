# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

deployment "simple" {
  inputs = {
    prefix    = "simple"
    instances = { "instance1" = 1 }  # 1 instance
  }
}

deployment "complex" {
  inputs = {
    prefix    = "complex"
    instances = { "instance1" = 1, "instance2" = 2, "instance3" = 3 }  # 3 instances
  }
}

