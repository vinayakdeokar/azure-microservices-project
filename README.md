# Azure DevOps End-to-End Project
# Azure Microservices E-Commerce Platform


A production-ready, cloud-native E-Commerce application architected with microservices to ensure high availability, fault tolerance, and seamless scalability. This project is a comprehensive showcase of modern DevOps engineering, demonstrating end-to-end automation of infrastructure and application deployments on the Microsoft Azure cloud ecosystem.


##  Key Features & Capabilities

- **Microservices Architecture**: Fully decoupled services for frontend, products, orders, and users.
- **Dynamic Multi-Environment CI/CD**: Fully automated Azure DevOps pipelines deploying to Dev, QA, UAT, and Production with approval gates.
- **Zero-Downtime Deployments**: Utilizes Kubernetes Rolling Updates to ensure continuous availability.
- **Automated SSL/TLS Provisioning**: Integrated Let's Encrypt and Cert-Manager for dynamic HTTPS certificate generation.
- **Advanced Ingress Routing**: Powered by Azure Application Gateway Ingress Controller (AGIC) for efficient Layer 7 load balancing.
- **Cross-Platform Compatibility**: Docker builds supporting ARM64 architectures for modern cloud instances.

---

##  Architecture Design

The platform is logically separated into autonomous microservices, preventing a single point of failure and allowing teams to deploy updates independently.

### Microservices Portfolio
1. **`frontend` (Node.js/Vanilla)**: The central user interface that acts as an aggregator, seamlessly communicating with downstream REST APIs to render the shopping experience.
2. **`product-api` (Node.js/Express)**: Responsibilities include catalog management, inventory tracking, and providing product metadata.
3. **`order-api` (Node.js/Express)**: Core business logic governing shopping cart operations, checkout flows, and payment gateway simulation.
4. **`user-api` (Node.js/Express)**: Manages customer profiles, authentication verification, and session state.
5. **`mongodb` (NoSQL)**: A shared, highly-performant document database serving persistent storage across backend APIs.

### Infrastructure Components
- **Azure Kubernetes Service (AKS)**: The orchestration engine managing the lifecycle of the Docker containers.
- **Azure Application Gateway (AGIC)**: Serves as the primary entry point to the cluster, managing routing, SSL termination, and protection against web vulnerabilities.
- **Azure Container Registry (ACR)**: securely stores, manages, and distributes the container images across environments.
- **DuckDNS**: Facilitates dynamic DNS resolution mapping domain names to the Application Gateway public IPs.

---

##  Repository Structure

```text
├── src/
│   ├── frontend/        # Web Application Source
│   ├── order-api/       # Order processing microservice
│   ├── product-api/     # Product catalog microservice
│   └── user-api/        # User management microservice
├── kube/
│   ├── frontend-service/ # AKS Manifests
│   ├── order-service/    # AKS Manifests
│   ├── product-service/  # AKS Manifests
│   ├── user-service/     # AKS Manifests
│   ├── mongo/            # Database StatefulSet Configuration
│   └── cluster-issurer.yaml # Cert-Manager AGIC Configuration
├── cicd/
│   ├── templates/        # Reusable CI/CD YAML Components
│   ├── frontend-pipeline.yml  # Main Pipeline
│   ├── order-api-pipeline.yml # Main Pipeline
│   ├── product-api-pipeline.yml # Main Pipeline
│   ├── user-api-pipeline.yml  # Main Pipeline
│   └── mongodb-pipeline.yml
└── README.md
```

---

##  CI/CD Pipeline Automation

The project employs a robust Continuous Integration and Continuous Deployment strategy via **Azure DevOps**.

### Stage 1: Build & Package (Dev)
- Triggered automatically upon `git push` to the `main` branch.
- Validates the codebase and executes multi-architecture Docker builds (`docker buildx`).
- Pushes the resulting images tagged with the commit SHA to the Development Azure Container Registry (`ecomacrdev001`).

### Stage 2: Deploy to Dev
- Authenticates securely to the AKS Dev Cluster using Azure Service Connections.
- Resolves the dynamic DuckDNS target domain based on the environment parameter.
- Applies Kubernetes manifests (`kubectl apply`) and triggers a rolling restart to serve the newly built image.

### Stage 3: Promote to Upper Environments (QA, UAT, PROD)
- Triggered manually after successful UAT testing.
- Utilizes the `promote-deploy.yml` template.
- Implements Image Promotion: Promotes the *exact same* verified Docker image from the Dev ACR to the Prod ACR, ensuring consistency.
- Deploys the application to the destination AKS Clusters.
- Enforces manual approval checks before production deployment to maintain strict governance.

---

##  Security Posture

- **Layer 7 Routing**: Microservices are securely isolated internally. External traffic is routed exclusively through API paths (`/products`, `/order`) governed by rigorous Ingress rules.
- **SSL Offloading**: Azure Application Gateway handles the computational overhead of TLS decryption.
- **Automated Certificate Authority**: `cert-manager` is natively integrated to overcome AGIC health probe limitations via specific `appgw` annotations, enabling fully automated Let's Encrypt `HTTP-01` SSL provisioning without administrative intervention.

---

##  Prerequisites

To orchestrate and manage this infrastructure, ensure the following CLI toolchains are locally available (Links removed for readability):
- Azure CLI
- Kubernetes CLI (kubectl)
- Docker Engine

Configuration Requirement: Connect your Azure DevOps project with an established Service Connection (`sc-ecom-azure-001`) possessing the requisite Contributor RBAC roles.

---

##  Local Environment Setup

Developers can emulate the microservices environments locally:

1. **Initialize Database Subsystem**: 
   ```bash
   docker run -d -p 27017:27017 --name mongodb mongo
   ```
2. **Launch Backend Microservices** (Execute in `src/order-api`, `src/product-api`, `src/user-api`):
   ```bash
   npm install
   npm start
   ```
3. **Launch Frontend Portal**:
   ```bash
   cd src/frontend
   npm install
   npm start
   ```
