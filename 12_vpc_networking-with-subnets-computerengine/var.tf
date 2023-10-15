variable "region" {
  type = string
  default = "us-central1"
  
}
variable "project-name" {
  type = string
  default = "masterterraformwithgcp-401503"
}

variable "name" {
  type           = string
  description  = "Name for this infrastructure"
  default       = "tflab"
}


variable"ip_cidr_range" {
  type=list(string)
  description="List of The range of internal addresses that are owned by this subnetwork."
  default=["10.10.10.0/24", "10.10.20.0/24"]
}