
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


variable "machine-type" {
  type    = string
  default = "e2-medium"
  
}

variable "env" {
  type    = string
  default = ""
  
}