provider "google" {
  project = "elemental-axle-459105-a0"
  region  = "us-west2"
}

module "vpc" {
  source     = "../modules/vpc"
  project_id = "elemental-axle-459105-a0"
  vpc_name   = "abridge-vpc"
  region     = "us-west2"
  subnets = {
    "subnet-1" = {
      primary  = "10.0.1.0/24"
      pods     = "10.10.0.0/16"
      services = "10.20.0.0/20"
    }
  }
}

module "service_accounts" {
  source     = "../modules/service_accounts"
  project_id = "elemental-axle-459105-a0"
  accounts   = ["prod-acct","dev-acct"]
}

module "gke" {
  source             = "../modules/gke"
  project_id         = "elemental-axle-459105-a0"
  cluster_name       = "gke-cluster"
  region             = "us-west2"
  node_count         = 3
  enable_autoscaling = true
  min_count          = 1
  max_count          = 5
  network            = module.vpc.network_name
  subnetwork         = module.vpc.subnet_names["subnet-1"]
  service_account_id = module.service_accounts.sa_ids["prod-acct"]
}