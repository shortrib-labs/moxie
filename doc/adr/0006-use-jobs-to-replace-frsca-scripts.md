# 6. Use jobs to replace FRSCA scripts

Date: 2023-01-16

## Status

Accepted

## Context

Installing FRSCA uses \`make\` to run several scripts that perform additional
steps beyond just applying Kubernetes manifests. Installing Moxie with
Replicated provides a simplified deplyoment flow at the cost of limiting what
we can do to only applying manifests. 

## Decision

Implement imperative installation in-cluster using Kubernetes jobs instead of
burdening the installer with running scripts against the cluster. This allows
for running arbitrary scripts with the capabilities available within Replicated.

## Consequences

Users installing Moxie will be able to stay within the Replicated Admin Console
and not have to run any scripts before, after, or during the installation.
There is a risk that some of the Kubernetes jobs will become a little janky in
order to work within this constraint.
