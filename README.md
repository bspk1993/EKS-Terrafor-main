# EKS cluster with Terraform

This folder contains a minimal Terraform configuration to create an EKS cluster and connect to it from your local machine.

## Prerequisites

- AWS account and an IAM user/role with permissions to create EKS, VPC, IAM, and related resources.
- AWS CLI installed and configured (`aws configure`).
- Terraform `>= 1.5.0`.
- `kubectl` installed.

## Files

- `versions.tf` – Terraform and provider versions.
- `providers.tf` – AWS provider configuration.
- `variables.tf` – Input variables (region, cluster name, CIDRs, node counts).
- `main.tf` – VPC and EKS modules.
- `outputs.tf` – Useful outputs (cluster endpoint, name, etc.).

## How to deploy

From the `eks` directory:

```bash
cd eks

# (Optional) adjust variables in variables.tf or via tfvars
terraform init
terraform plan
terraform apply
```

Confirm `terraform apply` when prompted. It can take 15–20 minutes for the EKS cluster and node group to be fully ready.

## Connect from your local machine

```
aws eks update-kubeconfig --name demo-eks --region us-west-2
```

After `terraform apply` completes, run:

```bash
aws eks update-kubeconfig \
  --name <your-cluster-name> \
  --region <your-region>
```

Using the defaults in `variables.tf`:

```bash
aws eks update-kubeconfig \
  --name demo-eks \
  --region us-east-1
```

Then verify access:

```bash
kubectl get nodes
kubectl get pods -A
```

If your AWS credentials are set up correctly on your local machine, you should now be able to manage the EKS cluster with `kubectl`.


