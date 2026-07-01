# Module 10: Sales Scenarios by Vertical

!!! info "Module Purpose"
    This is the **capstone module** — a practical guide for applying the SUSE portfolio across four major vertical markets. Each scenario covers the customer profile, competitive landscape, pain points, solution architecture, and a positioning script you can adapt. Use these scenarios to build conversational fluency before customer meetings.

---

## How to Use This Module

Each vertical follows the same structure:

| Section | What It Contains |
|:--------|:-----------------|
| **Customer Profile** | Company size, IT maturity, current stack, strategic goals |
| **Pain Points** | The specific challenges driving the customer to evaluate new infrastructure |
| **Competitive Landscape** | Who else is competing for this account and why |
| **Recommended Solution** | The SUSE products that map to each pain point |
| **Conversation Script** | A positioning monologue you can adapt for your first call |
| **Objection Handlers** | The 2-3 most likely objections and how to respond |
| **Key Proof Points** | Numbers and certifications specific to this vertical |

---

## Vertical 1: Financial Services

### Customer Profile

| Attribute | Detail |
|:----------|:-------|
| **Company** | Mid-sized regional bank or insurance firm (500–2,000 employees) |
| **IT Team** | 30–80 people, often split between infrastructure, security/compliance, and application teams |
| **Current Stack** | VMware vSphere (200–500 VMs), traditional SAN storage, perimeter firewall security |
| **Critical Apps** | SAP S/4HANA, core banking platform (e.g., Temenos), payment processing, loan origination |
| **Regulatory** | PSD2, GDPR, PCI DSS, FCA/ECB oversight, SOX if publicly traded |
| **Digital Initiative** | 12–24 months into containerization; 10–30 microservices in dev, few in production |
| **Board Concern** | Cybersecurity is a top-3 enterprise risk after a high-profile industry breach |

### Pain Points

- **VMware cost crisis** — Broadcom acquisition has driven renewal costs 2–5x higher; perpetual licenses eliminated
- **SAP on Kubernetes** — Finance function runs on SAP; IT needs a certified, production-grade K8s platform
- **Security gaps** — Traditional perimeter security doesn't work for containers; board demands zero-trust
- **Multi-location complexity** — HQ, DR site, and branch offices need consistent infrastructure
- **Temenos Core Banking** — New platform requires a validated K8s distribution

### Competitive Landscape

| Competitor | Why They're Considered | SUSE Advantage |
|:-----------|:-----------------------|:----------------|
| **Red Hat OpenShift** | Market leader, perceived enterprise stability | SUSE gives distribution choice (RKE2 + K3s), NeuVector security is included (ACS is extra), Fleet GitOps is native |
| **VMware Tanzu** | VMware incumbent, "safe choice" | Broadcom price increases make this untenable; Harvester at 3x density makes VMware migration mathematically compelling |
| **Cloud EKS/AKS/GKE** | Cloud-first digital transformation | Can't run SAP on-prem or at branches on managed K8s; single-SLA model breaks across multi-cloud |

### Recommended Solution

| Customer Need | SUSE Product | Why |
|:--------------|:-------------|:----|
| Production K8s for SAP | **RKE2 + Rancher Prime** | SAP-certified K8s with FIPS 140-2, CIS hardening |
| VMware replacement | **Harvester + Longhorn** | 3x VM density, no per-core licensing, live migration |
| Container security | **NeuVector** | Only K8s-native CNAPP with DLP + WAF + zero-trust |
| Branch edge | **K3s + Elemental** | 70 MB K8s + immutable OS for remote offices |
| Policy compliance | **Kubewarden** | PSD2/GDPR/PCI policies as code, audit-ready |
| GitOps deployment | **Fleet** | Native multi-cluster GitOps, built into Rancher |

### Conversation Script

!!! quote "Financial Services — Opening Positioning"
    "You're facing three pressures at once: your VMware renewal is coming at 3–5x the old price, your board wants zero-trust security after the recent industry breaches, and your SAP and Temenos teams need a certified container platform.

    **Most vendors can solve one of these. SUSE solves all three.**

    We give you an SAP-certified Kubernetes distribution (RKE2) managed by Rancher Prime, with NeuVector for zero-trust security — the only K8s-native platform that does DLP, WAF, and runtime protection in one product.

    For VMware migration, we're not asking for a rip-and-replace. Harvester runs alongside your existing vSphere. Rancher manages both. You migrate at your own pace — and when you do, you get 3x the VM density on the same hardware.

    **The cost math is simple:** Your Broadcom increase alone likely funds the SUSE platform — and we include security, storage, and management in a single subscription."

### Objection Handlers

> **"We've already started evaluating OpenShift."**

"OpenShift is a solid platform. The difference is in what's included. OpenShift's security platform (ACS) costs extra. Their GitOps tooling (Argo CD) costs extra. With SUSE, NeuVector and Fleet are included in the subscription. You also get a choice of distributions — RKE2 for your data center and K3s for your branches — both managed from the same Rancher console. OpenShift gives you one distribution at 1.5 GB. K3s is 70 MB and runs on a Raspberry Pi. Which one fits your branch offices better?"

> **"We can't walk away from our VMware investment."**

"You don't have to. Rancher Prime manages your existing vSphere clusters and new RKE2 clusters from the same console. Phase 1 is coexistence — prove the model on new container workloads. Phase 2 is selective VM migration to Harvester when your VMware renewal comes up. The industry reports customers achieving 40–70% TCO reduction on the other side."

### Key Proof Points

| Proof Point | Value | Why It Matters |
|:------------|:-----|:---------------|
| SAP certification | RKE2 certified for S/4HANA & BTP | Your finance team needs this validation |
| Temenos certification | Rancher Prime Temenos Core certified | Unique — no other K8s mgmt platform has this |
| VMware TCO reduction | 40–70% reported by migrants | The budget case for the CFO |
| NeuVector uniqueness | Only platform with DLP + WAF + zero-trust | Board-level security narrative |
| SUSE on SAP | 20+ years as #1 SAP Linux platform | Trust and relationship depth |
| Rancher adoption | 15,000+ customer teams | You're not our first financial services customer |

---

## Vertical 2: Retail & Manufacturing

### Customer Profile

| Attribute | Detail |
|:----------|:-------|
| **Company** | National retailer or manufacturer (1,000–10,000 employees) |
| **IT Team** | 20–50 people, lean for the number of locations |
| **Current Stack** | Mix of on-premises servers at HQ, minimal IT at branch/factory locations |
| **Critical Apps** | POS systems, inventory management, ERP, SCADA/MES (manufacturing), supply chain |
| **Locations** | 50–500+ retail stores or factory floors, many with no local IT staff |
| **Challenge** | Modernizing without IT headcount growth; offline operation at remote sites |

### Pain Points

- **No IT at remote locations** — Stores/factories have no on-site IT; infrastructure must be self-healing
- **Intermittent connectivity** — Many locations have unreliable or metered internet; systems must work offline
- **Hardware constraints** — Remote sites run on commodity hardware, not enterprise servers
- **Security at the edge** — Physical security is minimal; edge devices are vulnerable to tampering
- **OS management at scale** — Updating 500+ remote servers manually is impossible

### Competitive Landscape

| Competitor | Why They're Considered | SUSE Advantage |
|:-----------|:-----------------------|:----------------|
| **VMware Edge** | VMware footprint in data center | Requires vSphere at each edge site — too heavy and expensive for 500 stores |
| **OpenShift** | Enterprise credibility | MicroShift is 500 MB+ vs. K3s at 70 MB; no offline GitOps equivalent |
| **DIY (kubeadm, Ansible)** | Low upfront cost | Requires 2–3 FTE to manage the fleet — more expensive than SUSE subscription when headcount is factored in |

### Recommended Solution

| Customer Need | SUSE Product | Why |
|:--------------|:-------------|:----|
| Lightweight edge K8s | **K3s** | 70 MB binary, SQLite3 (no etcd), ARM-native |
| OS lifecycle at scale | **Elemental** | Immutable OS, OCI-based upgrades, fleet management |
| Multi-cluster management | **Rancher Prime** | Single console for HQ and all remote clusters |
| GitOps for edge | **Fleet** | Offline image sync, drift detection, 5K+ clusters |
| Edge security | **NeuVector Edge** | Lightweight enforcer for remote clusters |
| VM at HQ/DC | **Harvester** | Replace vSphere at data center with 3x density |

### Conversation Script

!!! quote "Retail & Manufacturing — Opening Positioning"
    "You have 200 stores — or 50 factory floors — and each one needs compute. But you don't have IT staff at those locations. Today, you're probably running everything from HQ, which means latency, bandwidth costs, and single points of failure.

    **SUSE Edge changes the model.** Each location runs K3s — a full Kubernetes distribution in a 70 MB binary that fits on a Raspberry Pi. Elemental manages the OS as an immutable image, updated via OCI artifacts through Fleet. If a device dies, you swap hardware, and Fleet reconciles the desired state automatically.

    The entire fleet — HQ, distribution centers, retail stores, factory floors — is managed from a single Rancher Prime console. Security is handled by NeuVector's lightweight enforcer on each edge node.

    **And the best part?** It all works offline. Fleet syncs images when connectivity is available. K3s runs indefinitely disconnected. When the network comes back, everything reconciles automatically."

### Objection Handlers

> **"Our stores don't have servers — everything is in the cloud."**

"Then you're paying for bandwidth every time a POS transaction goes to the cloud, and you have downtime if the internet goes down. With K3s at the edge, you run local compute for POS, inventory, and local caching — and batch-sync to the cloud when connectivity is available. The cost of a small edge device is recouped in bandwidth savings alone within months."

> **"Who's going to maintain Kubernetes at 200 locations?"**

"Nobody at the locations. Fleet manages everything from HQ. If a node fails, Fleet detects it and you get an alert. The OS is immutable — it's an OCI image that either boots or it doesn't. There's no SSH, no package management, no config drift at the edge. Your HQ team manages the entire fleet from one Rancher console."

### Key Proof Points

| Proof Point | Value | Why It Matters |
|:------------|:-----|:---------------|
| K3s binary size | <100 MB | Fits on industrial gateways, thin clients, Raspberry Pi |
| SQLite3 datastore | No etcd needed | One less component to fail at remote sites |
| Fleet off-grid sync | Automatic reconciliation after disconnection | No data loss when connectivity is intermittent |
| Elemental immutable OS | OCI-based, A/B updates | No OS drift at scale; rollback is instant |
| Edge variants | 3 (Edge/Industrial/Telco) | One platform, three deployment profiles |
| Deployment time | Hours, not days | From box to production in under an hour with pre-seeded images |

---

## Vertical 3: Telecommunications & Edge

### Customer Profile

| Attribute | Detail |
|:----------|:-------|
| **Company** | Telecom operator, ISP, or managed service provider |
| **Network Footprint** | Hundreds or thousands of points of presence (PoPs), central offices, cell sites |
| **IT Team** | Large (100+) but split between network engineering and IT operations |
| **Current Stack** | Proprietary network appliances, NFV infrastructure, centralized data centers |
| **Transformation** | 5G core modernization, MEC (Multi-access Edge Computing), network function virtualization |
| **Challenge** | Moving from proprietary hardware to software-defined, cloud-native infrastructure |

### Pain Points

- **Proprietary appliance costs** — Vendor-locked network appliances with high CapEx and long procurement cycles
- **5G/MEC requirements** — Ultra-low latency (sub-10ms) workloads need compute at the edge of the network
- **Central office modernization** — Replacing legacy telco infrastructure with standard servers
- **Lifecycle at scale** — Managing software on thousands of distributed nodes with no on-site hands
- **NFV transition** — Moving VNFs to CNFs (Cloud-Native Network Functions)

### Recommended Solution

| Customer Need | SUSE Product | Why |
|:--------------|:-------------|:----|
| 5G/MEC edge compute | **SUSE Edge Telco variant** | Real-time kernel, DPDK support, low-latency profile |
| Lightweight K8s at cell sites | **K3s** | 70 MB, offline-capable, small footprint |
| Fleet lifecycle management | **Elemental + Fleet** | OCI-based OS updates, GitOps at scale |
| Central management | **Rancher Prime** | Single pane for thousands of edge clusters |
| NFV/CNF security | **NeuVector** | Container security for network functions |
| Virtualization for legacy VNFs | **Harvester** | Run VNFs alongside CNFs on same infrastructure |

### Conversation Script

!!! quote "Telecommunications — Opening Positioning"
    "The 5G core is a Kubernetes-native workload. MEC requires compute at the edge of the network with sub-10ms latency. Your current infrastructure — proprietary appliances with centralized backhaul — was not designed for this.

    **SUSE Edge with the Telco variant** gives you a real-time, low-latency Kubernetes platform designed for the network edge. K3s at each cell site. Elemental for immutable, OCI-based OS lifecycle. Fleet for GitOps at the scale of thousands of nodes.

    Your central offices transition from hardware-centric to software-defined — standard servers running Harvester for legacy VNFs alongside RKE2 for cloud-native CNFs. One Rancher Prime console manages everything from the core network to the last mile.

    **And because it's 100% open source,** you're not locked into a single vendor's hardware or software roadmap. You choose your server hardware, your switching fabric, and your timing."

### Objection Handlers

> **"Our network functions are certified on specific hardware platforms."**

"Telco NFV certification cycles are real, and we respect that. SUSE Linux Enterprise Server for Telco is certified on leading hardware platforms from Intel, AMD, and ARM. The transition is gradual — run certified VNFs on Harvester while deploying new CNFs on RKE2. Both managed from Rancher. No rip-and-replace."

> **"We need carrier-grade availability — can open source deliver?"**

"K3s is production-proven at 1M+ clusters. Rancher Prime has a 99.9% SLA on the management plane. NeuVector provides runtime security for network functions. And SUSE has been delivering enterprise Linux for 30+ years — including to some of the world's largest telecom operators. Open source doesn't mean 'less reliable.' It means 'auditable, verifiable, and independently tested.'"

### Key Proof Points

| Proof Point | Value | Why It Matters |
|:------------|:-----|:---------------|
| SUSE Edge variants | 3 (Edge/Industrial/Telco) | Telco variant has real-time kernel, DPDK |
| K3s clusters | 1M+ | Proven at telecom scale |
| Fleet scale | 5,000+ clusters per controller | Single controller can manage your entire edge |
| Elemental immutable OS | A/B updates, rollback | Carrier-grade OS lifecycle guarantees |
| SLE for Telco | RTPREEMPT kernel, TSN support | Real-time capabilities for 5G/MEC |
| Rancher adoption | 15,000+ teams | Enterprise production track record |

---

## Vertical 4: Public Sector & Government

### Customer Profile

| Attribute | Detail |
|:----------|:-------|
| **Company** | Government agency, defense contractor, healthcare authority, or regulated utility |
| **IT Team** | 30–100 people, heavily compliance-focused |
| **Current Stack** | On-premises, air-gapped or restricted networks, legacy virtualization |
| **Critical Requirements** | FIPS 140-2, CIS hardening, supply chain security, on-premises only, long lifecycle |
| **Compliance Burden** | FedRAMP, NIST 800-53, DISA STIG, GDPR, national data sovereignty laws |
| **Procurement** | Long cycles, certified vendors only, no cloud lock-in allowed |

### Pain Points

- **Compliance mandates** — Every component must be FIPS-validated, CIS-benchmarked, with verifiable supply chain
- **Air-gapped operations** — No internet access for updates; everything must be mirrored locally
- **Long lifecycle requirements** — 5–7 year platform commitments; upstream K8s EOL every 12 months is unworkable
- **No cloud lock-in** — Data sovereignty regulations prohibit certain cloud usage
- **Supply chain security** — Every artifact must be signed, attested, and SBOM-documented
- **Vendor viability** — Must be a stable, long-term vendor (not a startup that may disappear)

### Competitive Landscape

| Competitor | Why They're Considered | SUSE Advantage |
|:-----------|:-----------------------|:----------------|
| **Red Hat OpenShift** | FedRAMP-listed, government contracts | SUSE has FIPS 140-2 across the stack, not just the OS; RKE2 is CIS-hardened out of the box |
| **DIY (upstream K8s)** | Full control, no vendor dependency | 5-year LTS vs. 12-month upstream EOL; SLSA L3 supply chain vs. unsigned community builds; single-vendor SLA |
| **VMware** | Incumbent in many agencies | Broadcom acquisition raises concerns about long-term pricing and product continuity for procurement |

### Recommended Solution

| Customer Need | SUSE Product | Why |
|:--------------|:-------------|:----|
| FIPS-validated K8s | **RKE2** | FIPS 140-2 validated, CIS-hardened, DISA STIG-ready |
| Supply chain security | **OCI Prime Registry** | SLSA L3, SBOM, signed artifacts |
| Air-gapped management | **Rancher Prime** | Fully offline operation, local Harbor mirror |
| Long lifecycle | **5-year LTS** | Predictable support timeline for 5+ year procurement |
| Container security | **NeuVector** | Full lifecycle CNAPP, compliance auditing |
| OS for worker nodes | **SLE Micro** | Immutable, FIPS-validated, minimal attack surface |

### Conversation Script

!!! quote "Public Sector — Opening Positioning"
    "Your procurement requires FIPS 140-2, CIS hardening, DISA STIG compliance, and a verifiable software supply chain. And you need to run fully air-gapped with a minimum 5-year platform commitment.

    **RKE2 is the only Kubernetes distribution that ships FIPS 140-2 validated and CIS-hardened out of the box.** Every component — from the kernel to the K8s control plane — uses FIPS-approved cryptographic modules.

    The OCI Prime Registry delivers SLSA L3 supply chain assurance. Every artifact is signed, attested, and SBOM-documented. Your auditors can trace every container image from your cluster back to its source commit.

    And because everything runs on-premises in an air-gapped environment — mirrored through a local Harbor registry — there's no cloud dependency. Your platform is certified, auditable, and sovereign.

    **SUSE has been delivering to governments and defense for 30+ years.** We understand the procurement cycle, the compliance requirements, and the need for long-term stability."

### Objection Handlers

> **"We need FedRAMP certification. Do you have it?"**

"SUSE Rancher Prime is available through AWS GovCloud as Rancher Hosted, which inherits AWS's FedRAMP authorization. For on-premises deployments, RKE2 is FIPS 140-2 validated and CIS-benchmarked — meeting the technical control requirements that underpin FedRAMP and NIST 800-53. We work with agency security teams to map our compliance artifacts to your specific control framework."

> **"A 5-year platform commitment is a long time for Kubernetes."**

"Exactly, and that's why SUSE offers 5-year LTS releases. Upstream Kubernetes releases a new version every 4 months and supports it for 12 months. You'd be upgrading every year. SUSE's LTS model gives you 5 years of stability with backported security patches — the same model that made SUSE Linux Enterprise the gold standard for regulated environments. Your security team approves once and doesn't touch it again for half a decade."

### Key Proof Points

| Proof Point | Value | Why It Matters |
|:------------|:-----|:---------------|
| FIPS 140-2 validation | RKE2 is FIPS-validated | Core compliance requirement for government |
| CIS hardening | Built-in cis-operator | Automatic compliance scans on every boot |
| SLSA Level | L3 (OCI Prime Registry) | Supply chain audit readiness |
| LTS duration | Up to 5 years | Procurement cycles, compliance re-certification |
| Air-gapped support | Native in Rancher Prime + Harbor | Offline operation without feature loss |
| SUSE longevity | 30+ years | Vendor stability for long procurement cycles |
| DISA STIG | SUSE Linux mapped to STIGs | Defense compliance requirements |

---

## Cross-Links to All Modules

| Module | Topic | Connection to Vertical Scenarios |
|:-------|:------|:--------------------------------|
| [Module 1: Strategy & Platform Overview](module-01-strategy.md) | SUSE strategy, vision, platform architecture | The overarching narrative for every vertical |
| [Module 2: K8s Distributions](module-02-k8s-distributions.md) | RKE2 & K3s deep dive | RKE2 for regulated environments (FIPS); K3s for edge/retail/telco |
| [Module 3: Rancher Prime](module-03-rancher-prime.md) | Multi-cluster management | Central control plane for all verticals |
| [Module 4: NeuVector](module-04-neuvector.md) | Container security (CNAPP) | Security narrative for financial services, public sector |
| [Module 5: Harvester](module-05-harvester.md) | VM virtualization on K8s | VMware migration story for every vertical with legacy VMs |
| [Module 6: Edge Computing](module-06-edge.md) | SUSE Edge, Elemental, K3s | Core technology for retail, manufacturing, telco verticals |
| [Module 7: Storage & GitOps](module-07-storage-gitops.md) | Longhorn + Fleet | Stateful apps for financial services; GitOps for multi-location retail |
| [Module 8: Kubewarden](module-08-kubewarden.md) | Policy as Code | Compliance policies for financial services, public sector |
| [Module 9: Ecosystem & Competitive](module-09-ecosystem-competitive.md) | Competitive positioning | The competitive narratives used in every objection handler |
| [Module 11: MultiLinux Management](module-11-multilinux.md) | MultiLinux Manager & Support | Cross-distro Linux management for heterogeneous environments |
| [Quick Reference Card](quick-reference.md) | Cheat sheet | Key numbers, product URLs, comparison matrices |

---

## Summary

The four verticals represent the highest-value markets for the SUSE portfolio:

| Vertical | Primary SUSE Product | Key Differentiator | Typical Deal Size |
|:---------|:---------------------|:-------------------|:-----------------:|
| **Financial Services** | Rancher Prime + RKE2 + NeuVector + Harvester | SAP/Temenos certification, VMware migration | $200K–$2M |
| **Retail & Manufacturing** | SUSE Edge (K3s + Elemental + Fleet) | Lightweight edge, offline GitOps, no IT at remote sites | $100K–$1M |
| **Telecommunications** | SUSE Edge Telco + K3s + Elemental + Fleet | Real-time kernel, DPDK, MEC, massive scale | $500K–$5M |
| **Public Sector** | RKE2 + OCI Prime Registry + NeuVector | FIPS 140-2, CIS, SLSA L3, air-gapped, 5-year LTS | $200K–$3M |

!!! tip "Practice Approach"
    For each vertical, try to:
    
    1. Deliver the opening script in under 90 seconds
    2. Handle the two listed objections without notes
    3. Cite at least two proof points from the key numbers table
    4. Map each customer pain point to a specific SUSE product
    5. Contrast SUSE with the competitive alternative
    
    The goal is **conversational fluency** — not recitation. Your customer should hear someone who understands their industry, not someone reading from a script.

---

*Prepared for the SUSE Portfolio Positioning Exercise. Module 10 — Sales Scenarios by Vertical. June 2026.*