resource "google_compute_instance" "testvm" {
  name         = "test"
  machine_type = "e2-medium"

  tags = ["foo", "bar"]

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



resource "google_compute_instance" "testvm-1" {
  provider = google.us-east
  name         = "test-1"
  machine_type = "e2-medium"

  tags = ["foo", "bar"]

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


