# 3. Install with Replicated

Date: 2023-01-08

## Status

Accepted

## Context

I've started this project so I can implemeent an example secure supply chain
for distributing software with Replicated. I'll may need to rapidly create,
destroy, recreate, and keep current many instances of the platform in order to
share this example.

## Decision

To simplify creating the platform, recreating it when needed, and keeping it
up-to-date it will be packaged and installle with Replicated. A community
liense will be stored in the GitHub repository.

## Consequences

Since I'll be using the platform as part of my work at Replicated and using
Replicated as part of the implementation it will become a model of using
Replciated. This requires that the implementation evolve along with
Replicated's toolkit and best practice recommendations.
