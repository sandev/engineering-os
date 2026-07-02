---
name: architecture-decision-records
description: Author and review Architecture Decision Records (ADRs) that capture a decision, its context, and consequences. Use when the user makes a significant, hard-to-reverse technical decision, asks to document or review an ADR, or needs to record why an architecture choice was made.
---

# Architecture Decision Records

An ADR is a short document that captures one significant architectural decision, the forces behind it, and its consequences. Write an ADR when a choice is costly to reverse, affects multiple teams, or future engineers will ask "why is it like this?"

## When to write one

Use the **one-way vs two-way door** test. One-way doors (costly or near-impossible to reverse) deserve an ADR and careful deliberation; two-way doors (cheaply reversible) usually do not — decide fast and move on. Write an ADR for a decision that is **significant** and **hard to reverse**:

- Choosing a datastore, queue, or core framework
- A public API contract or cross-service boundary
- A build-vs-buy decision
- A security, compliance, or data-residency stance
- Deprecating or replacing a major component

Do **not** write an ADR for routine, easily reversible choices (variable names, a helper library used in one file).

## Workflow

```
- [ ] 1. Frame the decision as a single question
- [ ] 2. Capture the context and forces (constraints, requirements, deadlines)
- [ ] 3. List the options actually considered (2-4)
- [ ] 4. State the decision and the reasoning
- [ ] 5. Record consequences: what gets better, what gets worse, what to watch
- [ ] 6. Number it and set status; link related ADRs
```

**Numbering:** ADRs are immutable and append-only. Number sequentially (`0001`, `0002`, ...). Never edit a decided ADR to change its meaning; instead write a new ADR that supersedes it and update the old one's status to `Superseded by ADR-NNNN`.

**Status values:** `Proposed` → `Accepted` → `Superseded` / `Deprecated`. Use `Rejected` for options-explored records that were declined.

## Template

Use this exact structure. Keep it to one page.

```markdown
# ADR-NNNN: <short decision title>

- Status: Proposed | Accepted | Rejected | Superseded by ADR-NNNN | Deprecated
- Date: YYYY-MM-DD
- Decision owner: <single accountable decision-maker>
- Consulted: <others whose input shaped it>

## Context

What is the situation and what forces are at play? State the problem,
the constraints (deadlines, budget, team skills), and the requirements
that matter. Be factual and neutral. No solution yet.

## Decision

We will <the decision>, because <the primary reasons>.

## Options considered

### Option A: <name> (chosen)
- Pros: ...
- Cons: ...

### Option B: <name>
- Pros: ...
- Cons: ...

## Consequences

- Positive: what becomes easier or safer.
- Negative / trade-offs: what becomes harder or riskier, and the cost we accept.
- Follow-ups: work this unlocks or requires, and metrics to watch.
```

## Quality bar

A strong ADR:

- Frames **one** decision, not a status update or a design doc.
- Is honest about the trade-offs of the chosen option (if it has none, you have not thought hard enough).
- Names the options that were genuinely considered, including "do nothing."
- Is written so a new engineer in two years understands *why*, not just *what*.
- States consequences explicitly, including the costs being accepted.

## Reviewing an ADR

When reviewing, check that the context is neutral (not written to justify a foregone conclusion), that at least one credible alternative is present, that trade-offs of the *chosen* option are acknowledged, and that the decision is reversible-or-not is clear. Push back if the ADR reads like marketing for a predetermined answer.
