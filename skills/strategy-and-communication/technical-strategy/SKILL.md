---
name: technical-strategy
description: Set and communicate technical direction, prioritizing investments, sequencing bets, weighing tech debt against features, and aligning engineering work to business goals. Use when defining a roadmap or technical vision, deciding what to build/fix/kill next, justifying platform or tech-debt investment, or aligning engineering to company strategy.
---

# Technical Strategy

Strategy is choosing what *not* to do. A good technical strategy connects engineering effort to a business outcome, makes the hard trade-offs explicit, and gives the org a shared "why" so hundreds of local decisions point the same direction. It is not a list of projects, it is the reasoning that decides which projects earn funding.

## When to use this

- Setting a team or org roadmap or technical vision.
- Deciding what to build, fix, or kill next cycle.
- Justifying investment in platform, reliability, or tech-debt paydown.
- Aligning an engineering plan to a company objective.

## Start from the business objective, not the technology

Every credible strategy traces back to an outcome the business cares about: revenue, cost, growth, risk, speed, or customer trust. If you cannot state which one a piece of work serves, that is a finding, not a detail.

- Name the objective and the **metric** it should move.
- State the **binding constraint**: what actually limits that outcome today, capacity, reliability, velocity, or a missing capability?
- Strategy is removing the binding constraint, not doing more of everything.

## Make the trade-offs explicit

Strategy lives in what you sacrifice. Force the choices into the open:

- **Now vs later:** what you fund this cycle and what you consciously defer.
- **Features vs foundation:** the split between new product and platform/reliability/debt. Name the ratio and defend it.
- **Build vs buy vs partner** for each major capability.
- **Reversible vs irreversible bets:** move fast on two-way doors; deliberate on one-way doors and record them (see the `architecture-decision-records` skill).

## Tech debt and platform investment

Leaders under-invest here because the cost is invisible until it compounds. Make it legible:

- Frame debt as a **tax on future delivery** in concrete terms ("every feature in X takes ~2x because of Y"), not as "cleanliness."
- Tie paydown to an **outcome**: delivery speed, incident rate, onboarding time, or cost.
- Timebox and sequence it alongside features rather than waiting for a mythical "later."

## The strategy on a page

```markdown
# <Team/Area> Technical Strategy, <period>

## Objective
The business outcome and the metric it moves.

## Current state & binding constraint
What's true today and the one thing most limiting the objective.

## Strategy (the bets)
The 2-4 bets we are making, each tied to the objective, and WHY these
over the alternatives.

## Explicitly not doing
What we are deferring or killing, and why. (This section IS the strategy.)

## Sequencing
Rough order and dependencies, what unlocks what.

## How we'll know it worked
Leading and lagging metrics.

## Risks
The bets that could be wrong and what we'd watch for.
```

## Quality bar

- Every bet traces to a business objective and a metric.
- The "not doing" list is real and specific, a strategy that funds everything is not a strategy.
- Trade-offs are explicit and defended, not hidden behind "and also."
- It survives a skeptical executive: numbers are defensible and the sequencing is credible (see the `writing-for-executives` skill for communicating it).
- It is short enough that the team can remember and act on it without re-reading.

## Anti-patterns

- A roadmap of projects with no objective and no "why", a list, not a strategy.
- Funding everything; refusing to say what you won't do.
- Justifying platform or tech-debt work by "cleanliness" instead of business impact.
- Writing it once and never revisiting when the binding constraint moves.
- Boiling the ocean: a transformation so large it never ships value incrementally.
- Confusing activity (output, velocity) with outcome (the metric actually moved).
