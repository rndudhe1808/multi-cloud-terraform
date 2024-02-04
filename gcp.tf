terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("/root/multi-cloud/gcp/cred.json")  # Specify the path to your Google Cloud credentials file
  project     = "multi-cloud-413304"  # Replace with your Google Cloud project ID
  region      = "us-west1"
  zone        = "us-east1-b"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"  # Corrected the machine type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
  }
}
