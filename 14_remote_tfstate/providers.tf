provider "google" {
    project = "tflab-310"
    region = "us-central1"
    zone = "us-central1-a"
    credentials = "../creds/keys-tflab.json"
}

terraform {
  backend "gcs" {
    credentials = "../creds/keys-tflab.json"
    bucket = "tfstate-terraformproject-rp7"
    prefix = "terraform/state"
    
  }
}
