# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

deployment "dev-env-1" {
  inputs = {
    prefix           = "development"
    instances        = 1
  }
  deployment_group = deployment_group.dev
}

/*
deployment "dev-env-2" {
  inputs = {
    prefix           = "simple"
    instances        = 1
  }
  deployment_group = deployment_group.dev
}
*/

deployment "prod-1" {
  inputs = {
    prefix           = "prod-1"
    instances        = 3
  }
  destroy = false
}

deployment "prod-2" {
  inputs = {
    prefix           = "prod-2"
    instances        = 3
  }
}

deployment "staging" {
  inputs = {
    prefix           = "staging"
    instances        = 3
  }
}

deployment_group "dev" {
  auto_approve_checks = [deployment_auto_approve.no_destroy]
}

deployment_auto_approve "no_destroy" {
  check {
    condition = context.plan.changes.remove == 0
    reason    = "Plan removes ${context.plan.changes.remove} resources."
  }
}
