# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = "../creds/keys.json"
}

terraform {
  required_providers {
  kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
}

