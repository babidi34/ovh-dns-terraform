terraform {
  required_providers {
    ovh = {
      source = "ovh/ovh"
      version = "0.47.0"
    }
  }
}

provider "ovh" {
}