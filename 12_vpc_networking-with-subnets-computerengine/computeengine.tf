resource "google_compute_instance" "public" {
  name         = "public-instance"
  machine_type  = "n1-standard-1"
  #zone         =   "${element(var.var_zones, count.index)}"
  zone          =   "${format("%s","${var.region}-b")}"
  tags = ["allow-http","allow-ssh"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
         webserver =  "true"     
    }
    }
  }

    metadata_startup_script = <<SCRIPT
         #! /bin/bash
            apt update
            apt -y install apache2
            cat <<EOF > /var/www/html/index.html
            <html><body><p>i am webserver running on public instance</p></body></html>
           
        SCRIPT

network_interface {
    subnetwork = "${google_compute_subnetwork.this[0].name}"
    
    access_config {
      // Ephemeral IP
    }
    
  }
}


resource "google_compute_instance" "private" {
  name         = "private-instance"
  machine_type  = "n1-standard-1"
  #zone         =   "${element(var.var_zones, count.index)}"
  zone          =   "${format("%s","${var.region}-b")}"
  tags = ["allow-http-internal"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

   metadata_startup_script = <<SCRIPT
         #! /bin/bash
            apt update
            apt -y install apache2
            cat <<EOF > /var/www/html/index.html
            <html><body><p>i am webserver running on private instance</p></body></html>
            
        SCRIPT

network_interface {
    subnetwork = "${google_compute_subnetwork.this[1].name}"
   
  }
}

output "publicsubnet"  { 
        value = google_compute_instance.public.id
    }