# 📈 Stock Price App - Full DevOps Automation

This project automates the deployment and monitoring of a Stock Price web application using **Terraform**, **Ansible**, and **Jenkins**, with a full observability stack and infrastructure built dynamically on **AWS**. It includes NGINX reverse proxy servers, Java Spring Boot backends, and a Prometheus + Grafana monitoring stack — all deployed through modular Ansible playbooks and a Jenkins CI/CD pipeline.

---

## 🏗️ Architecture Overview

<pre> ``` ┌────────────────────┐ │ Jenkins CI/CD │ └────────┬───────────┘ │ ┌────────▼───────────┐ │ Ansible Control │ └────────┬───────────┘ │ ┌──────────────────┼───────────────────┐ │ │ │ ┌─────▼────┐ ┌─────▼────┐ ┌─────▼─────┐ │ NGINX 1 │ │ NGINX 2 │ │ Monitoring│ │ (Ubuntu)│ │ (Amazon) │ │ (Docker) │ │ + Exporter + Exporter Prometheus, │ Reverse Proxy Reverse Proxy Grafana, └─────┬────┘ └─────┬────┘ Node/NGX/JVM │ │ │ ┌─────▼────┐ ┌─────▼────┐ │ │ JAVA 1 │ │ JAVA 2 │ │ │ (Spring) │ │ (Spring) │ │ │ + Exporter + Exporter │ └──────────┘ └──────────┘ ▼ All Hosted on AWS EC2 Instances ``` </pre>

## 🧰 Technologies Used

- **Terraform** — for provisioning AWS infrastructure (EC2, security groups, tags, etc.)
- **Ansible** — for configuration management and app/service deployment
- **Jenkins** — CI/CD orchestration using modular pipelines
- **AWS** — EC2 for app and web nodes, tagged for dynamic inventory
- **Prometheus + Grafana** — containerized observability stack
- **Node Exporter, NGINX Exporter, Java Exporter** — for detailed metrics

---

## 📁 Repositories

- 🔧 Terraform + Jenkins: [`stock-app-prac`](https://github.com/uthmanakz/stock-app-prac.git)
- 📦 Ansible Playbooks: [`stock-app-playbook-prac`](https://github.com/uthmanakz/stock-app-playbook-prac.git)
- 📡 Dynamic Inventory: [`stock-app-inventory-prac`](https://github.com/uthmanakz/stock-app-inventory-prac-.git)

---

## 🔄 CI/CD Pipeline Breakdown

### Jenkins Pipelines (Split for Modularity):

1. **Provisioning Pipeline**
   - Terraform initializes AWS EC2 instances with proper tags.

2. **Configuration Pipelines**
   - Playbooks install and configure:
     - NGINX + reverse proxy
     - Java 17, Maven 3, Spring Boot app (with service wrappers)
     - Node, NGINX, and JVM exporters

3. **Monitoring Pipeline**
   - Deploy Prometheus and Grafana as containers
   - Auto-configure targets using Ansible templates and AWS dynamic inventory

---

## 🎯 Features

- ✅ **Dynamic Ansible Inventory** powered by AWS EC2 tags
- ✅ **Modular Playbooks** per service role (nginx, java, monitoring)
- ✅ **Reverse Proxy Routing** from NGINX to backend Java apps
- ✅ **Monitoring Coverage**:
  - System metrics (Node Exporter)
  - Web traffic (NGINX Exporter)
  - JVM stats (Java Exporter)
- ✅ **Prometheus & Grafana** run as containers on a dedicated EC2 instance

