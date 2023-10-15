resource "google_compute_instance" "testvm" {
  
  count = "${length(var.availability_zone)}"
  zone = "${element(var.availability_zone, count.index)}"
  name         = "test-${element(var.availability_zone, count.index)}"
  machine_type = "e2-small"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "terraformvm"
      }
    }
  }


  network_interface {
    network = "default"
    // access_config will provide an external ip for the vm 
    //so you can access the vm from outside networks ie. from internet or your local pc
    access_config {
      // Ephemeral public IP
    }

  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

 
}

