# gcp-terraform-module

Reusable Terraform module for provisioning a secure GCP environment with VPC, subnets, GKE, and IAM configuration.

This repository demonstrates infrastructure-as-code (IaC) principles using Terraform to provision:
- A custom VPC with secondary IP ranges
- Named subnets
- GKE cluster with optional autoscaling
- Service accounts with IAM bindings

The module follows GCP best practices, uses typed variables, and supports flexible input overrides.
