# 2. Expand on FRSCA

Date: 2023-01-08

## Status

Accepted

## Context

FRSCA is a great example of secure supply chain best practices that I'd like to
follow. It's implemenation makes some decisions that support being a strong
example but differ from the team's production recommendations. This
implementaiton should embrace those production recommenation and also use some
tools I'm more familiar with that have a better user experience, for example
using Harbor as the registry.

## Decision

MOXIE will fork from FRSCA in order to leverage the FRSCA team's work, follow
their production recommendations, and provide a stronger UX.

## Consequences

Forking from an existing project requires keeping up improvements made to the
upstream project instead of taking direct advantage of the improvements.
