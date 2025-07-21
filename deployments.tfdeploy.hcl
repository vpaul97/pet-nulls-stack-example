# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

deployment "simple" {
  inputs = {
    prefix           = "simple"
    instances        = 1
  }
  deployment_group = deployment_group.simple
}

deployment "complex" {
  inputs = {
    prefix           = "complex"
    instances        = 3
  }
  destroy = false
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

deployment "complex4" {
  inputs = {
    prefix           = "complex4"
    instances        = 3
  }
}

deployment_group "simple" {
  auto_approve_checks = [deployment_auto_approve.no_destroy]
}

deployment_auto_approve "no_destroy" {
  check {
    condition = context.plan.changes.remove == 0
    reason    = "Plan removes ${context.plan.changes.remove} resources."
  }
}
