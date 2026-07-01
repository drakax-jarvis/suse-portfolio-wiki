# Module 5: Virtualization & HCI — Harvester / SUSE Virtualization

!!! note "Module Context"
    This module covers Harvester, the cloud-native hyperconverged infrastructure (HCI) platform built on Kubernetes. It is the primary virtualization solution in the SUSE Cloud Native stack. For the Rancher management plane that operates Harvester, see [Module 3: Rancher Prime](module-03-rancher-prime.md). For the underlying block storage technology, see [Module 7: Longhorn & GitOps Storage](module-07-storage-gitops.md).

## Architecture Overview

![Harvester Cloud-Native HCI Architecture](assets/images/harvester-architecture.svg)

## What Is Harvester?

Harvester is an **open-source, cloud-native HCI platform** built entirely on Kubernetes. Unlike traditional virtualization stacks (VMware vSphere, Nutanix AHV) that bolt on Kubernetes as an afterthought, Harvester treats Kubernetes as the *foundation* — VMs are first-class Kubernetes resources managed via the Kubernetes API.

| Property | Traditional HCI (VMware) | Harvester |
|---|---|---|
| Control plane | Proprietary (vCenter) | Kubernetes API + Rancher |
| VM hypervisor | ESXi (proprietary) | KubeVirt (KVM-based, OSS) |
| Storage | vSAN (proprietary) | Longhorn (CSI, OSS) |
| OS layer | vSphere ESXi | Elemental / SLE Micro |
| Management | vCenter GUI | Rancher / kubectl / Dashboard |
| API model | Proprietary SDK | Kubernetes-native CRDs |

!!! tip "Key Insight"
    Because Harvester uses Kubernetes-native APIs (CRDs, custom controllers, operators), every VM operation — create, migrate, snapshot, scale — is a `kubectl` command or a `Rancher` API call. There is no separate virtualization management silo.

## Architecture

The Harvester stack is layered from bare metal upward:

```
┌──────────────────────────────────────────────┐
│             Harvester Dashboard              │
│           (kubectl / Rancher UI)             │
├──────────────────────────────────────────────┤
│           KubeVirt (VM runtime)              │
│   VM CRDs → libvirt → KVM (QEMU/KVM)        │
├──────────────────────────────────────────────┤
│   Longhorn (distributed block storage)       │
│   CSI driver → replication → snapshots      │
├──────────────────────────────────────────────┤
│         Kubernetes (upstream K8s)            │
│   Scheduling, networking (CNI), RBAC         │
├──────────────────────────────────────────────┤
│    Elemental / SLE Micro (atomic OS)        │
│   Immutable, container-optimized host OS    │
├──────────────────────────────────────────────┤
│              Bare Metal / Server             │
│   x86_64, aarch64, NVMe, HDD, GPU, NIC      │
└──────────────────────────────────────────────┘
```

### Layer Breakdown

| Layer | Component | Role |
|---|---|---|
| **Host OS** | Elemental / SLE Micro | Immutable, transactional-update OS; provides KVM host capability |
| **Kubernetes** | Upstream K8s (RKE2 / K3s variant) | Schedules VMs as pods, manages networking and storage |
| **Virtualization** | KubeVirt | Runs VMs inside KVM; VM CRDs (`VirtualMachine`, `VirtualMachineInstance`) |
| **Storage** | Longhorn | CSI-compliant distributed block storage; replication, snapshots, backups |
| **Networking** | Harvester CNI | VLAN-backed networks; bridge, provider networks, DHCP for VMs |
| **Management** | Harvester Dashboard + Rancher | Web UI, REST API, Rancher `virt` plugin |

## Key Features

### VM Lifecycle Management

VMs in Harvester are defined as Kubernetes custom resources. The full lifecycle is handled through CRDs — a typical `VirtualMachine` YAML manifest specifies CPU cores, memory, disks (virtio bus), network interfaces (bridge binding), and a data volume for the root disk.

Operations exposed through the UI and API:

- **Create / Delete** — from ISO, image templates, or clone
- **Start / Stop / Restart** — graceful ACPI or forced power-cycle
- **Resize** — live CPU/memory hotplug (KubeVirt v1.0+)
- **Console access** — VNC, serial console, SPICE
- **Cloud-init** — first-boot configuration baked into VM templates

### Live Migration

Harvester supports **live migration** of running VMs between nodes with zero downtime:

1. VM memory is copied to the target node (pre-copy phase)
2. Dirty pages are iteratively transferred
3. A brief pause finalizes state (downtime < 100ms typical)
4. VM resumes on target node — IP, connections, and disk I/O preserved

!!! warning "Live Migration Requirements"
    - Shared storage for VM disks (Longhorn volumes are shared across nodes)
    - Source and target nodes must both have capacity
    - No passthrough devices (GPU, SR-IOV) may block migration
    - VMs with `EvictionStrategy: LiveMigrate` are automatically migrated on node drain

### Backup, Snapshot & Restore

Longhorn provides the storage-layer capabilities. Harvester integrates them into the VM management workflow:

| Feature | Scope | Mechanism |
|---|---|---|
| **VM Snapshots** | Point-in-time disk state | Longhorn volume snapshot |
| **VM Backups** | Full VM + metadata to S3/NFS | Longhorn backup target |
| **VM Templates** | Golden images from snapshots | Convert snapshot → template |
| **Restore** | Back to original or new VM | From snapshot or backup |
| **Scheduled Backups** | Cron-based recurring backups | Backup CRD with schedule |

### Storage

Storage in Harvester is **Longhorn-powered** (see [Module 7: Longhorn & GitOps Storage](module-07-storage-gitops.md) for the deep dive):

- **Distributed block storage** — each node contributes local disks to a unified pool
- **Synchronous replication** — 2x or 3x replication factor for HA
- **Thin provisioning** — allocate on write, not on create
- **Encryption** — volume-level encryption with user-provided keys
- **CSI driver** — standard Kubernetes CSI interface for dynamic provisioning

Storage classes available to VMs:

| Storage Class | Replication | Use Case |
|---|---|---|
| `harvester-longhorn` | 2x | General purpose |
| `harvester-longhorn-ha` | 3x | Mission-critical VMs |
| `harvester-longhorn-migratable` | 2x + Live Migrate flag | VMs requiring live migration |

### Networking

Harvester networking uses the **KubeVirt bridge binding** with VLAN-backed networks:

- **Management network** — Kubernetes node-to-node, API traffic
- **VLAN networks** — one or more VLAN-tagged networks for VMs
- **Provider networks** — direct external network attachment
- **DHCP for VMs** — built-in DHCP server per network
- **Network Policies** — Kubernetes NetworkPolicy applies to VM traffic

Networks are defined as `NAD` (NetworkAttachmentDefinition) CRDs. A VM can be attached to multiple networks.

### Rancher Integration

Harvester is a **first-class node driver** in Rancher Prime. Key integration points:

- **Provision Harvester clusters** from Rancher GUI (one-click deployment)
- **Manage VMs** inside Rancher via the `virt` plugin dashboard
- **RBAC** — Rancher project/namespace mapping controls VM access
- **Multi-cluster** — manage multiple Harvester clusters from a single Rancher instance
- **Apps & Marketplace** — deploy Helm charts alongside VMs

!!! tip "Rancher + Harvester = Unified Hybrid Cloud"
    Rancher Prime manages both container workloads (RKE2/K3s clusters) and virtual machines (Harvester) from the same dashboard. This is the foundation of the VMware off-ramp: VMs and containers co-exist under a single management plane.

## SUSE Virtualization 1.5 (SUSECON 2025 Innovations)

Announced at SUSECON 2025, **SUSE Virtualization 1.5** is the commercial enterprise version of Harvester with certified support and enhanced features.

### Certified Storage

SUSE Virtualization 1.5 adds certified support for enterprise external storage arrays, enabling **mixed-mode deployments** where VMs can use either Longhorn (hyperconverged) or external SAN/NAS:

| Storage Vendor | Protocol | Use Case |
|---|---|---|
| **Dell PowerStore / PowerMax** | iSCSI, FC | Enterprise SAN migration |
| **NetApp ONTAP** | NFS, iSCSI | NAS consolidation |
| **Oracle FS / ZFS** | iSCSI, FC | Oracle database workloads |
| **Portworx (Pure Storage)** | CSI | Cloud-native storage for K8s |

### CSI Support

External storage is consumed through the **Kubernetes CSI** interface:

- **Direct CSI integration** — no proprietary shim layers
- **Dynamic volume provisioning** — storage classes map to array pools
- **Snapshot & clone** — array-native snapshots via CSI
- **Volume expansion** — online resize through the array CSI driver

!!! note "Why This Matters"
    This allows organizations to keep their existing SAN infrastructure while adopting Harvester — a critical requirement for VMware migration timelines where storage refresh is deferred.

## VMware Off-Ramp — The Complete Migration Story

Harvester + Rancher Prime form SUSE's **complete VMware off-ramp** — a path to exit VMware licensing without forklifting existing virtual infrastructure.

### The Migration Narrative

```
Phase 1: Coexistence           Phase 2: Consolidation        Phase 3: Full Exit
┌─────────────────────┐        ┌─────────────────────┐       ┌─────────────────────┐
│ VMware + Harvester  │  ──►   │ Harvester primary   │  ──►  │ Harvester only      │
│ Rancher manages     │        │ VMware decomm       │       │ Rancher unified mgmt│
│ both environments   │        │ VM migration window │       │ Container-native    │
└─────────────────────┘        └─────────────────────┘       └─────────────────────┘
```

### Migration Tooling

| Tool | Phase | Purpose |
|---|---|---|
| **Rancher Prime** | 1 | Single dashboard across vSphere + Harvester |
| **VM Import Wizard** | 1–2 | Convert VMware VMDK → Harvester image; retain guest OS config |
| **Veeam / Commvault** | 1–2 | Third-party backup migration (certified) |
| **Harvester Live Migration** | 2 | Rebalance VMs across nodes with zero downtime |
| **Rancher Cluster API** | 2–3 | Declarative cluster lifecycle for K8s nodes |
| **SUSE Virtualization 1.5 CSI** | 2–3 | Re-connect existing SAN to Harvester without storage migration |

### Key Selling Points for VMware Migrations

- **License cost elimination** — no per-core VMware licensing
- **Unified management** — one Rancher UI for VMs + containers
- **API-driven** — Infrastructure-as-Code for virtual infrastructure
- **Open standards** — KubeVirt, Longhorn, KVM; no vendor lock-in
- **Operational continuity** — existing teams keep their tooling (VNC, SSH, cloud-init)

!!! warning "Migration Considerations"
    - VM templates may need OS reconfiguration (virtio drivers, cloud-init)
    - GPU passthrough and SR-IOV have specific KubeVirt requirements
    - DRS-equivalent load balancing uses K8s scheduling + live migration
    - Existing backup tools must support KubeVirt/Longhorn targets

## Maintenance Mode, Cordoning & Node Management

Harvester implements Kubernetes-native node management operations.

### Node Operations

| Operation | What It Does | VM Impact |
|---|---|---|
| **Cordon** | Mark node unschedulable for new VMs | No impact on running VMs |
| **Drain** | Evict all VMs from node | VMs with `LiveMigrate` migrate; others shut down |
| **Maintenance Mode** | Cordon + drain + disable monitoring | All VMs migrated or stopped; node is offline |
| **Enable Maintenance** | Start maintenance mode for hardware work | VMs move to other nodes automatically |
| **Disable Maintenance** | Return node to service | Node re-joins cluster, VMs can be scheduled |
| **Delete Node** | Remove from cluster permanently | VMs must be evacuated first |

### Maintenance Mode Workflow

1. **Enable Maintenance** — Harvester cordons the node and begins draining VMs
2. **Live Migration** — VMs with `EvictionStrategy: LiveMigrate` move to healthy nodes without downtime
3. **Forced Shutdown** — VMs without migration strategy are gracefully shut down (ACPI)
4. **Node Offline** — Node is safe to power off for hardware replacement
5. **Disable Maintenance** — Node joins cluster, VMs can be manually restarted or re-scheduled

!!! tip "Production Best Practice"
    Always configure VM templates with `EvictionStrategy: LiveMigrate` for production workloads. Test maintenance mode on a non-critical node first to validate migration paths and capacity headroom on remaining nodes.

---

> **SUSE Cloud Native Positioning:**
> *"Harvester is not 'a hypervisor on Kubernetes.' It is Kubernetes becoming the hypervisor. Every VM is a pod. Every storage operation is a CSI call. Every network policy applies to virtual and container workloads equally. In a world moving toward unified infrastructure, Harvester is the only platform that starts from the cloud-native foundation and builds virtualization on top — not the other way around."*
>
> — SUSE CTO Office, Cloud Native Solutions

---

## Cross-References

| Module | Topic | Link |
|---|---|---|
| Module 3 | Rancher Prime — managing Harvester clusters | [module-03-rancher-prime.md](module-03-rancher-prime.md) |
| Module 7 | Longhorn deep dive — storage architecture | [module-07-storage-gitops.md](module-07-storage-gitops.md) |
| Module 6 | Edge Computing — Harvester at the edge | [module-06-edge.md](module-06-edge.md) |
| Module 2 | Kubernetes distributions — RKE2 underpinnings | [module-02-k8s-distributions.md](module-02-k8s-distributions.md) |
| Module 11 | MultiLinux Management | [module-11-multilinux.md](module-11-multilinux.md) |
