---
name: security-threat-modeling
description: Systematically find what could go wrong with a system's security before attackers do, identifying assets, trust boundaries, threats, and mitigations. Use when designing or reviewing a feature or system for security, handling sensitive data, exposing a new surface, or asking "how could this be abused?"
---

# Security Threat Modeling

Threat modeling is thinking like an attacker while you still have cheap options. You ask, structurally, *what are we protecting, who might attack it, how, and what stops them?* Do it during design, retrofitting security after build is expensive and usually incomplete.

## The four questions

Anchor every threat model on these (the Shostack framing):

1. **What are we building?** A data-flow view: components, data stores, and how data moves between them.
2. **What can go wrong?** The threats against each element and flow.
3. **What are we going to do about it?** Mitigations for the threats that matter.
4. **Did we do a good job?** Validate the model and the mitigations.

## Map assets and trust boundaries

- **Assets:** what has value and must be protected, credentials, PII, payment data, secrets, integrity of critical operations.
- **Trust boundaries:** where data crosses from less-trusted to more-trusted (internet → your API, browser → server, service → database, third-party → you). **Threats concentrate at boundaries**: every input crossing one is untrusted until validated.
- Draw the data flow and mark each boundary. Most vulnerabilities live where you assumed trust you hadn't earned.

## Enumerate threats with STRIDE

Walk each element/flow against these categories:

| Threat | Is the risk that… | Countered by |
|--------|-------------------|--------------|
| **S**poofing | someone impersonates a user/service | authentication |
| **T**ampering | data is modified in transit or at rest | integrity checks, signing, TLS |
| **R**epudiation | an actor denies an action | audit logging |
| **I**nformation disclosure | data leaks to the unauthorized | encryption, access control |
| **D**enial of service | the system is made unavailable | rate limits, quotas, timeouts |
| **E**levation of privilege | someone gains rights they shouldn't | authorization, least privilege |

## Core defenses

- **Validate all input at trust boundaries;** never trust the client. Prevent injection with parameterized queries and safe encoding/escaping.
- **AuthN vs AuthZ:** authenticate *who*, then authorize *what*, check permissions at the boundary on every request, not just in the UI.
- **Least privilege:** every component, credential, and token gets the minimum access it needs, for the minimum time.
- **Defense in depth:** assume any single control fails; layer them so one bug isn't game over.
- **Secrets management:** never in code, logs, or client. Rotate; scope narrowly.
- **Encrypt** sensitive data in transit and at rest.
- **Supply chain:** pin and vet dependencies; a compromised package runs with your privileges.

## Prioritize and act

You can't fix everything. Rank threats by **likelihood × impact**, mitigate the serious ones, and consciously accept (and record) the rest. Capture significant, hard-to-reverse security decisions as an ADR (see the `architecture-decision-records` skill), and fold these threats into design and code review (see the `system-design-review` and `code-review` skills).

## Anti-patterns

- Trusting the client, or validating only in the UI.
- Security as a final gate instead of a design input.
- Authorization checked once at login, not per request/resource.
- Rolling your own crypto or auth instead of vetted primitives.
- Secrets in source control, logs, or error messages.
- Modeling only the "hacker" and ignoring the malicious insider and the honest-but-fooled user.
- Producing a threat model no one turns into tracked, owned mitigations.
