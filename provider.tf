terraform {
  required_version = ">= 0.12, < 0.13"
}
provider "google" {
  credentials  = file("../key.json")
  
  project = "tough-valve-249918"
  region  = "us-central1"
  zone    = "us-central1-c"
}