terraform {
  required_providers {
    google = {
        source = "harshicorp/google"
        version = "3.5.0"
    }
  }
}
provider "google" {
    #accidentials = file
    project = ""
    region = "us-west1"
    zone = "us-east1-b"

}
resource "google_compute_network" "vpc_network" {
    name = "terraform-network"  
}
resource "gooogle_compute_instance" "vm_instance" {
    name = "terraform-instance"
    machine_type = "ec2-micro"
    boot_disk {
        initialoize_params {
            image = "debian-cloud/debian-11"
        }
    }
    network_interface {
        network = google_compute_network.vpc_network.name
        acess_config {
            
        }
    }
  
}
