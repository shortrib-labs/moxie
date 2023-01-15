# 5. Vendor Helm charts as tarballs

Date: 2023-01-09

## Status

Accepted

## Context

It is best practice to vendor in platform dependencies. FRSCA follows this
practice by vendoring in the source code for all Helm charts it installes
(using Helm pull). Replicated requires a tarball in order to package and
process a Helm chart.

## Decision

All dependent Helm charts should be vendored in aa tarballs.

## Consequences

Helm charts must be vendored in using the `http` capabilities of Vendir,
since the `helm` alternative does not allow preserving the tarball.
