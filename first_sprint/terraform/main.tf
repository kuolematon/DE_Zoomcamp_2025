terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.18.1"
    }
  }
}

provider "google" {
  project     = "zoomcamp-6887"
  region      = "europe-north1"
  zone        = "europe-north1-c"
}

resource "google_storage_bucket" "zoomc-ucket" {
  name          = "zoomcamp-6887-terraform"
  location      = "EU"
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
