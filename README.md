# GCP Terraform Module

Reusable Terraform module for provisioning a secure GCP environment with VPC, subnets, GKE, and IAM configuration.

---

## 🚀 How to Use This Terraform Module

This module provisions a secure GCP environment including:
- A custom VPC
- Subnetworks with secondary IP ranges for pods and services
- A GKE cluster with optional autoscaling
- IAM Service Accounts

---

### ✅ Prerequisites

Before using this module, make sure:

1. **Google Cloud SDK is installed**
   ```bash
   brew install --cask google-cloud-sdk
   ```

2. **Authenticate and set default credentials**
   ```bash
   gcloud auth application-default login
   ```

3. **Enable required GCP APIs**
   ```bash
   gcloud services enable compute.googleapis.com \
                            container.googleapis.com \
                            iam.googleapis.com
   ```

4. **Terraform >= 1.3.0 is installed**
   [Install Terraform](https://developer.hashicorp.com/terraform/downloads)

---

### 📁 Project Structure

```
.
├── modules/
│   ├── vpc/
│   ├── gke/
│   └── service_accounts/
├── example/
│   └── main.tf
├── README.md
```

---

### ⚙️ Using the Module

1. Navigate to the example directory:
   ```bash
   cd example
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Preview the infrastructure plan:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

5. Destroy the resources when done:
   ```bash
   terraform destroy
   ```

---

### 🔄 Customize Inputs

Override variables like this in your `example/main.tf`:

```hcl
module "gke" {
  source             = "../modules/gke"
  cluster_name       = "demo-cluster"
  region             = "us-west2"
  enable_autoscaling = true
  min_count          = 1
  max_count          = 5
  ...
}
```

---

### 📌 Notes

- `deletion_protection` is set to `false` by default to allow safe cleanup with `terraform destroy`.
- Make sure the GCP account you're using has the necessary permissions for Compute Engine, Kubernetes Engine, and IAM APIs — these are required for what I used in the setup.
