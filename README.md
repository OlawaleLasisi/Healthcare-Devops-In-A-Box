
# 🏥 DevOps-In-A-Box: Healthcare Sector

## 📌 Overview

This production-ready DevOps-In-A-Box solution is tailored for the healthcare industry with strong emphasis on regulatory compliance, security, and observability. It enables teams to automate infrastructure provisioning and deployments using Terraform, ARM templates, GitHub Actions, and Azure Pipelines, while ensuring robust security and monitoring through Azure Key Vault, HashiCorp Vault, Snyk, Prometheus, Grafana, and Azure Monitor.

---

## 📁 Project Structure

```
healthcare-sector-devops-in-a-box/
├── iac/
│   ├── environments/
│   │   ├── dev/
│   │   ├── staging/
│   │   └── production/
│   └── modules/
│       └── network/
├── ci-cd/
│   ├── github-actions/
│   │   └── main.yml
│   └── azure-pipelines.yml
├── observability/
│   ├── prometheus/
│   ├── grafana/
│   └── azure-monitor/
├── security/
│   ├── key-vault/
│   ├── snyk/
│   └── vault/
├── scripts/
│   ├── bootstrap.sh
│   └── deploy.sh
└── README.md
```

---

## 🔧 Prerequisites

```bash
brew install terraform
brew install azure-cli
brew install snyk
brew install docker
```

Ensure you are authenticated to Azure and GitHub, and have access to your Vault and Prometheus environments.

---

## 🚀 Setup Instructions

### 1. Bootstrap Environments

```bash
chmod +x scripts/bootstrap.sh
./scripts/bootstrap.sh
```

Initializes all environments for Terraform usage.

---

### 2. Deploy Infrastructure

```bash
chmod +x scripts/deploy.sh
./scripts/deploy.sh dev
./scripts/deploy.sh staging
./scripts/deploy.sh production
```

---

## 🔁 CI/CD Integration

### GitHub Actions

File: `ci-cd/github-actions/main.yml`

Steps:
- Triggered on push to main
- Initializes and plans Terraform changes

```bash
# Push changes to main branch
git add .
git commit -m "Trigger GitHub Actions CI"
git push origin main
```

### Azure Pipelines

File: `ci-cd/azure-pipelines.yml`

Steps:
- Run in Azure DevOps with service connections
- Applies Terraform infrastructure

---

## 🛡️ Security Implementation

- **Azure Key Vault** for secrets management
- **Snyk** to scan IaC for vulnerabilities:

```bash
snyk iac test iac/environments/dev
```

- **HashiCorp Vault** HCL policies located in `security/vault/policies.hcl`

---

## 📊 Observability Setup

- **Prometheus** setup via config in `observability/prometheus/config.yml`
- **Grafana** dashboard JSON located at `observability/grafana/dashboard.json`
- **Azure Monitor** workspace setup:

```bash
az monitor log-analytics workspace create --resource-group healthcare-rg --workspace-name healthcare-logs
```

---

## 📐 Architecture Diagram (ASCII)

```
         +--------------------------+
         | Developer Push to GitHub|
         +--------------------------+
                     |
             +------------------+
             | GitHub Actions   |
             +------------------+
                     |
         +---------------------------+
         | Terraform + ARM Templates |
         +---------------------------+
                     |
      +-------------------------------+
      | Azure Infra: RG, VNET, Vaults |
      +-------------------------------+
                     |
      +--------------------------------------------+
      | Observability & Security Layers            |
      | (Prometheus, Grafana, Azure Monitor, Vault)|
      +--------------------------------------------+
```

---

## 🧰 Toolchain Summary

| Layer         | Tools Used                               |
|---------------|-------------------------------------------|
| CI/CD         | GitHub Actions, Azure Pipelines           |
| IaC           | Terraform, ARM Templates                  |
| Security      | Azure Key Vault, Snyk, HashiCorp Vault    |
| Observability | Prometheus, Grafana, Azure Monitor        |

---

## 🛠️ Integration Steps

1. Clone this repository:

```bash
git clone https://github.com/OlawaleLasisi/Healthcare-Devops-In-A-Box.git
cd healthcare-devops-in-a-box
```

2. Configure secrets and environment variables in GitHub Actions and Azure Pipelines.

3. Run `bootstrap.sh` and `deploy.sh` to provision environments.

4. Monitor system using Grafana dashboards and Azure Monitor.

---

## 📬 Support

**DevOps Team:** olawalelasisi@outlook.com  
**Documentation:** https://confluence.com/devops-in-a-box

---
