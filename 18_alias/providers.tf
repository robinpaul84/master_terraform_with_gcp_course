provider "google" {
    project = "masterterraformwithgcp-401503"
    region = "us-central1"
    zone = "us-central1-a"
    credentials = "../creds/keys.json"
}


provider "google" {
    alias = "us-east"
    project = "masterterraformwithgcp-401503"
    region = "us-east1"
    zone = "us-east1-b"
    credentials = "../creds/keys.json"
}
