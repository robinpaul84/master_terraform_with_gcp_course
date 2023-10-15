# SUBNETS
resource"google_compute_subnetwork" "this" {
    count= 2
    name="${var.name}-${local.type[count.index]}-subnetwork"
    ip_cidr_range= var.ip_cidr_range[count.index]
    region=var.region
    network=google_compute_network.this.id
    private_ip_google_access =true
}
