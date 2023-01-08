# 4. Allow existing CA chain

Date: 2023-01-08

## Status

Accepted

## Context

The initial FRSCA implementation bootstraps a CA using cert-manager. In some
scenarios a team may want to use an existing CA chain. I'd like to show this 
scenario as part of talking about a secure supply chain.

## Decision

Uses Replicated configuration options to enable specifying an existing CA
certificate or generate a CA from scratch.

## Consequences

Allows demonstrating a supply chain that's part of an exsisting chain of trust.
