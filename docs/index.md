---
title: SUSE Portfolio — Deep Study Wiki
---

# SUSE Portfolio — Deep Study Wiki

**Portfolio Knowledge Preparation Guide**

!!! info "Purpose of This Wiki"

    This wiki provides deep-dive knowledge across the entire SUSE portfolio. Each module combines technical depth, competitive positioning, and customer conversation frameworks — all aligned with the latest **SUSECON 2025** announcements and product roadmaps.

---

## At a Glance

> **SUSE is the only enterprise Linux and container management company delivering a truly open, independent, and secure platform for running workloads anywhere — from the data center to the edge to the public cloud.**

The material is structured to build your ability to:

1. Articulate the SUSE **strategy and vision**
2. Map SUSE products to real-world **customer needs**
3. Differentiate SUSE vs. **Red Hat, VMware, and DIY approaches**
4. Demonstrate fluency across **11 core domains** of the portfolio
5. Handle **customer scenarios across 4 major verticals** with credibility

---

## The 11 Study Modules

| # | Module | Description | Est. Time |
|:--:|:-------|:------------|:---------:|
| 1 | [Strategy & Platform Overview](module-01-strategy.md) | SUSE strategy, SUSECON 2025 vision, open-source leadership, portfolio architecture | 45 min |
| 2 | [K8s Distributions (RKE2, K3s)](module-02-k8s-distributions.md) | RKE2 (hardened, FIPS-ready, CIS-benchmarked) and K3s (lightweight, <100 MB, edge-optimized) | 45 min |
| 3 | [Rancher Prime Multi-Cluster Mgmt](module-03-rancher-prime.md) | Centralized Kubernetes management, fleet operations, GitOps with Fleet, OCI Prime Registry, SLSA L3 | 60 min |
| 4 | [Security (NeuVector)](module-04-neuvector.md) | Only K8s-native container security platform with zero-trust, DLP, WAF, AI/ML threat detection | 60 min |
| 5 | [Virtualization (Harvester)](module-05-harvester.md) | Modern VM platform built on KubeVirt, Longhorn, and Elemental — alternative to vSphere at the edge | 45 min |
| 6 | [Edge Computing](module-06-edge.md) | Three-tier edge (Edge/Industrial/Telco), Elemental for fleet OS management, offline operations | 45 min |
| 7 | [Storage & GitOps](module-07-storage-gitops.md) | Longhorn for persistent storage, Fleet for multi-cluster GitOps, Rancher Prime Backup | 45 min |
| 8 | [Policy as Code (Kubewarden)](module-08-kubewarden.md) | WebAssembly-based policy engine, context-aware policies, policy hub, integration with NeuVector | 45 min |
| 9 | [Ecosystem & Competitive](module-09-ecosystem-competitive.md) | Competitive positioning: SUSE vs. Red Hat, VMware, Canonical; partner ecosystem, SAP/Temenos validation | 60 min |
| 10 | [Sales Scenarios by Vertical](module-10-sales-scenarios.md) | Customer conversation practice across Financial Services, Retail, Telco/Edge, and Public Sector | 90 min |
| 11 | [MultiLinux Management](module-11-multilinux.md) | SUSE MultiLinux Manager, cross-distro support, enterprise Linux lifecycle management | 30 min |

---

## Getting Started — Suggested Study Path

### :material-flag-checkered: Recommended Full Path (8–10 hours)

| Step | Activities |
|:-----|:-----------|
| **1. Start Here** | Read the [Quick Reference Card](quick-reference.md) for a portfolio-wide view. 15 min. |
| **2. Foundation** | Complete [Module 1](module-01-strategy.md) (Strategy) and [Module 2](module-02-k8s-distributions.md) (K8s Distributions). 90 min. |
| **3. Core Management** | [Module 3](module-03-rancher-prime.md) (Rancher Prime) — the management brain of the stack. 60 min. |
| **4. Security Deep Dive** | [Module 4](module-04-neuvector.md) (NeuVector). Security is the #1 enterprise concern. 60 min. |
| **5. Adjacent Domains** | [Module 5](module-05-harvester.md) + [Module 7](module-07-storage-gitops.md) (VM + Storage). 90 min. |
| **6. Edge & Policy** | [Module 6](module-06-edge.md) + [Module 8](module-08-kubewarden.md) (Edge + Policy). 90 min. |
| **7. Competitive Readiness** | [Module 9](module-09-ecosystem-competitive.md) — understand the landscape. 60 min. |
| **8. MultiLinux** | [Module 11](module-11-multilinux.md) — SUSE MultiLinux Manager & Support. 30 min. |
| **9. Capstone** | [Module 10](module-10-sales-scenarios.md) — vertical scenarios practice. 90 min. |

### :material-account-tie: Experienced Practitioner Path (4–5 hours)

If you already have Kubernetes fluency, focus on SUSE-specific differentiation:

1. [Quick Reference Card](quick-reference.md) (15 min)
2. [Module 1](module-01-strategy.md) — Strategy (30 min, skim)
3. [Module 9](module-09-ecosystem-competitive.md) — Competitive (60 min, **critical**)
4. [Module 4](module-04-neuvector.md) — NeuVector (45 min)
5. [Module 8](module-08-kubewarden.md) — Kubewarden (30 min)
6. [Module 10](module-10-sales-scenarios.md) — Vertical Scenarios (90 min)

### :material-school: Partner / SE Path (6 hours)

1. [Quick Reference Card](quick-reference.md)
2. [Module 2](module-02-k8s-distributions.md) (RKE2/K3s) — the products you'll demo most
3. [Module 3](module-03-rancher-prime.md) (Rancher Prime)
4. [Module 6](module-06-edge.md) (Edge — high-growth segment)
5. [Module 9](module-09-ecosystem-competitive.md) (Competitive)
6. [Module 10](module-10-sales-scenarios.md) (Vertical Scenarios)

---

## Key Facts at a Glance

!!! warning "Must-Know Numbers for Customer Conversations"

    These numbers are drawn from **IDC analysis, SUSECON 2025 keynotes, and SUSE public materials.**

| Metric | Value | Source / Context |
|:-------|:-----:|:-----------------|
| Teams using Rancher | **15,000+** | Rancher adoption globally |
| Average annual benefit (IDC) | **$3.4M** | IDC Business Value Study |
| K3s binary size | **<100 MB** | Single binary, ARM + x86 |
| K3s active clusters | **1M+** | Community adoption metric |
| Longest LTS duration | **Up to 5 years** | SUSE Linux Enterprise and Rancher Prime |
| Release cycle | **4 months** | Predictable, enterprise-safe cadence |
| SLSA Level | **L3** (Rancher Prime Registry) | Supply-chain Levels for Software Artifacts |
| NeuVector CVEs detected (2024) | **15,000+** | Real-world threat telemetry |
| Kubewarden policies available | **250+** | Community + verified policy hub |
| Harvester VM density | **Up to 3x vs. vSphere** | Independent benchmark, equivalent hardware |
| Edge deployment variants | **3** (Edge / Industrial / Telco) | SUSE Edge 3.0 |
| SAP-certified SUSE Linux | **#1** | SAP's preferred Linux platform for 20+ years |
| Temenos Core banking | **Certified** | Rancher + SUSE Linux for mission-critical banking |
| Fleet clusters managed | **5,000+** | Maximum tested per single Fleet controller |
| Longhorn adoption | **30,000+** | Active deployments globally |

---

## Product Reference Links

| Product | URL |
|:--------|:----|
| Rancher Prime | [https://www.suse.com/products/rancher](https://www.suse.com/products/rancher) |
| RKE2 | [https://docs.rke2.io](https://docs.rke2.io) |
| K3s | [https://k3s.io](https://k3s.io) |
| NeuVector | [https://neuvector.com](https://neuvector.com) |
| Harvester | [https://harvesterhci.io](https://harvesterhci.io) |
| Longhorn | [https://longhorn.io](https://longhorn.io) |
| Kubewarden | [https://www.kubewarden.io](https://www.kubewarden.io) |
| Fleet | [https://fleet.rancher.io](https://fleet.rancher.io) |
| SUSE Edge | [https://www.suse.com/products/suse-edge](https://www.suse.com/products/suse-edge) |
| Elemental | [https://elemental.docs.rancher.com](https://elemental.docs.rancher.com) |
| OCI Prime Registry | [https://registry.rancher.com](https://registry.rancher.com) |
| SUSE AI | [https://www.suse.com/products/suse-ai](https://www.suse.com/products/suse-ai) |
| SUSE MultiLinux Support | [https://www.suse.com/products/multilinux-support](https://www.suse.com/products/multilinux-support) |
| SUSE Linux Enterprise | [https://www.suse.com/products/suse-linux-enterprise](https://www.suse.com/products/suse-linux-enterprise) |

---

## Study Tips

!!! tip "Active Recall Over Passive Reading"

    Build **conversational fluency**, not memorization. For each module:
    
    1. Read the module content
    2. Close the page and explain the key points aloud in 60 seconds
    3. Re-read only the sections you stumbled on
    4. Practice the **customer conversation starters** and **objection handlers**
    
!!! note "Focus on 'Why SUSE, Not the Other Guy'"

    The goal is **positioning**, not product recitation. Every answer should connect a **customer pain point** to a **SUSE solution** and then contrast it with the **competition**. Deep competitive knowledge is often as important as product knowledge.

!!! warning "SUSECON 2025 Content Is Fair Game"

    All modules include SUSECON 2025 announcements. If a customer asks "What's new from SUSE?" you need recent, specific answers. Pay particular attention to:
    
    - **Rancher Prime 3.3** — enhanced Fleet, AI workload support
    - **NeuVector 5.5** — AI/ML model scanning, expanded runtime
    - **SUSE Edge 3.0** — industrial and telco variants
    - **SUSE AI** — enterprise AI platform on open infrastructure
    - **SLE 16** — next-gen SUSE Linux Enterprise preview

---

### :material-format-list-checks: Prerequisites

Before diving in, ensure you have:

- Basic understanding of Kubernetes concepts (pods, services, deployments, namespaces)
- Familiarity with Linux container fundamentals (Docker/Podman, container registries)
- Access to the [SUSE Customer Portal](https://scc.suse.com) for evaluation licenses
- (Optional) A Rancher Prime Sandbox environment ([https://www.suse.com/products/rancher](https://www.suse.com/products/rancher))

---

*All data sourced from SUSECON 2025 keynotes, IDC studies, and SUSE product documentation. Last updated: June 2026.*