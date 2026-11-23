# DevOps & Cloud Deployment Strategies Lab (Lab 4)

A complete, hands-on implementation repository covering Disaster Recovery, CI/CD Automated Quality Gates, Blue-Green Deployments, GitOps with Argo CD, Enterprise Secret Management, and Canary Rollouts.

## Repository Structure

```text
devops-deployment-strategies-lab/
├── 01-disaster-recovery/
│   ├── backup-restore.sh
│   └── velero-schedule.yaml
├── 02-cicd-automated-testing/
│   └── .github/workflows/ci-gate.yml
├── 03-blue-green-deployment/
│   ├── deployment-blue.yaml
│   ├── deployment-green.yaml
│   └── service.yaml
├── 04-gitops-argocd/
│   └── argocd-application.yaml
├── 06-secret-management/
│   └── external-secret.yaml
└── 07-canary-deployment/
    └── canary-rollout.yaml
```

## Lab Modules Overview

1. **Disaster Recovery (`01-disaster-recovery/`)**: Automated PostgreSQL backup/restore scripts with integrity checksums and Velero scheduled Kubernetes cluster backups (RPO: 15 mins, RTO: < 5 mins).
2. **CI/CD Automated Testing (`02-cicd-automated-testing/`)**: GitHub Actions pipeline enforcing unit tests, coverage thresholds, and integration tests with PostgreSQL service containers as blocking gates before container builds.
3. **Blue-Green Deployment (`03-blue-green-deployment/`)**: Zero-downtime environment switching in Kubernetes via Service label selector updates (`version: blue` -> `version: green`).
4. **GitOps-Based Delivery (`04-gitops-argocd/`)**: Declarative Kubernetes delivery using Argo CD with automated drift detection (`selfHeal: true`) and pruning (`prune: true`).
5. **Secret Management (`06-secret-management/`)**: External Secrets Operator (ESO) integration with HashiCorp Vault to inject dynamic credentials without storing plaintext secrets in Git.
6. **Canary Deployment (`07-canary-deployment/`)**: Progressive traffic shifting (`10% -> 30% -> 60% -> 100%`) using Argo Rollouts with automated Prometheus error-rate rollback triggers.
