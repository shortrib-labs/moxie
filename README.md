# Moxie

> I'm working on developing an acronym for Moxie, a name I chose in honor of
> my liberal borrowing from FRSCA, my Masschusetts heritage, and my schooling
> in Maine.

In this lab, we will create a Kubernetes platform for a development team that
distributes its software using [Replicated](https://replicated.com). The
environment is made up of three clusters and inspired by the [TKG
Lab](/Tanzu-Solutions-Engineering/tkg-lab). It also borrows liberally from the
[FRSCA](/buildsec/frsca) projects. All clusters are deployed using
[kURL](https://kurl.sh) with supporting packages installed using
[KOTS](https://kots.io).

The initial implemenation of the lab is for vSphere, but support for AWS,
Azure, and GCP is forthcoming. The current implementations directly leverage
vSphere/vSAN for disk management, but may move to OpenEBS in the future.

Leverages the following external services:

- **Okta** as an OIDC provider
- **Let's Encrypt** as Certificate Authority
- **Sigstore** for signing, attestations, SBOMs and other metadata

Additional components installed into the management cluster:

- **Elasticsearch and Kibana** for log aggregation and viewing
- **Vault** for secret management
- **Spire** for SPIFFE identity control

Additional components installed into the platform cluster:

- **Minio** for object storage (via kURL)
- **Harbor** as a local container and Helm chart registry
- **Tekton** for continuous integration and delivery
- **Tekton Chains** to apply signatures and make attestations

## Goals and Audience

The goal of this repository is to provide Replicated team members with a
[secure softare factory](https://github.com/cncf/tag-security/blob/main/supply-chain-security/secure-software-factory/Secure_Software_Factory_Whitepaper.pdf)
to demonstrate best practices to vendors delivering their software with 
[Replicated](https://replicated.com).

## Required CLIs

- kubectl
- kots
- preflight and support-bundle kubectl plugins (nice to have for troubleshooting)
- velero
- helm 
- yq 
- jq
- vendir

## Other Pre-Requisites

For now, this repository assumes you are installing into existing clusters. The clusters have three roles:

1. Security - for logging, secrets, and certificate identity management
2. Shared Services - devops tooling
3. Workload - to run the packaged application for exploratory testing
