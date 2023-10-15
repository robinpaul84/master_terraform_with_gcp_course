variable "region" {
  type    = string
  default = "us-central1"

}

variable "zone" {
  type    = string
  default = "us-central1-a"

}

variable "project-id" {
  type    = string
  default ="masterterraformwithgcp-401503"
}

variable "vm-name" {
  default = {
    default = "",
    dev = "vm-dev",
    prod = "vm-prod"
      }
}

variable "machine-type" {
  default = {
    default = "e2-medium",
    dev = "e2-small",
    prod = "e2-medium"
  }
  
}