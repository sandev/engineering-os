---
name: system-design-review
description: Run a structured review of a system or service design across scalability, reliability, security, cost, and operability. Use when the user shares an architecture, asks to review a system design, evaluate a proposed service, or pressure-test a design before build.
---

# System Design Review

Review a proposed system design methodically so nothing important is skipped. The goal is to surface risks and trade-offs early, while the design is still cheap to change.

## Start by anchoring on requirements

Before critiquing anything, restate what the system must do. A design can only be judged against its requirements.

- **Functional:** what does it do, for whom, at what scale?
- **Non-functional (the numbers):** target throughput (RPS), latency (p50/p99), data volume and growth, availability target (e.g. 99.9%), consistency needs, and cost envelope.

If these numbers are missing, ask for them or state explicit assumptions. Reviewing a design without target numbers produces vague feedback.

## Review dimensions

Walk each dimension. For each, note strengths, risks, and concrete questions.

### 1. Correctness & data model
- Is the data model right? Entities, relationships, ownership.
- Source of truth for each piece of data — is it single and clear?
- Consistency model: strong vs eventual, and does that match the requirement?

### 2. Scalability
- Where is the bottleneck as load grows 10x? (usually a stateful component)
- Read vs write scaling. Caching strategy and invalidation.
- Partitioning/sharding key — does it avoid hotspots?
- Statelessness of services for horizontal scaling.

### 3. Reliability & availability
- Single points of failure. What happens when each dependency is down?
- Failure modes: timeouts, retries (with backoff + jitter), idempotency, circuit breakers.
- Blast radius: how is failure contained? Bulkheads, rate limits, graceful degradation.
- Data durability, backups, and tested recovery (RPO/RTO).

### 4. Security & privacy
- AuthN/AuthZ at each boundary. Least privilege.
- Data classification: what is sensitive? Encryption in transit and at rest.
- Input validation and trust boundaries. Secrets management.
- Compliance/data-residency constraints.

### 5. Operability
- Observability: metrics, structured logs, traces, and the SLOs that matter.
- Deployability: rollout/rollback story, migrations, feature flags.
- On-call: what alerts fire, and are they actionable?

### 6. Cost
- Dominant cost drivers (compute, storage, egress, third-party).
- Does cost scale linearly, sub-linearly, or worse with usage?

### 7. Simplicity & evolvability
- Is anything more complex than the requirements justify?
- What is the migration path from today's system?
- Which decisions are one-way doors and deserve an ADR?

## Feedback format

Organize findings by severity so the author knows what blocks progress:

- **Blocking** — will fail a stated requirement or cause data loss/outage. Must resolve.
- **Major** — significant risk or cost; resolve or consciously accept before build.
- **Minor** — improvement or simplification; author's discretion.
- **Question** — unclear; needs an answer before it can be assessed.

For each finding, name the dimension, the specific concern, and a suggested direction — not just "this is wrong."

## Anti-patterns to flag

- Designing for scale the requirements do not demand (premature distribution, needless microservices).
- Retries without idempotency or backoff (retry storms).
- A cache with no invalidation or staleness story.
- No source-of-truth clarity for shared data.
- "It'll be fine" for the dependency-down and rollback questions.

## Close the review

End with: the top 3 risks, what must change before build, and the one-way-door decisions that warrant an ADR (see the `architecture-decision-records` skill).
