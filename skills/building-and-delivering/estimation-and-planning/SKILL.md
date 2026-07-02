---
name: estimation-and-planning
description: Estimate engineering work and turn it into a credible, sequenced plan under uncertainty. Use when sizing a project, breaking work into milestones, forecasting a delivery date, committing to a deadline, or explaining why an estimate is a range rather than a number.
---

# Estimation & Planning

An estimate is a probability distribution, not a promise. The job is not to guess the "right" number — it is to communicate uncertainty honestly, decompose work until it is knowable, and give decision-makers something they can plan around. Most estimation failures are really **scoping** failures: the work was never broken down enough to see the risk.

## The core stance

- **Estimate ranges, not points.** "3–5 weeks (80% confidence)" is honest; "4 weeks" implies a precision you do not have.
- **Uncertainty comes from the unknowns.** The way to shrink an estimate's range is to shrink the unknowns — decompose, spike, prototype — not to squeeze the number.
- **Separate estimate from target from commitment.** The estimate is your forecast; the target is what the business wants; the commitment is what you'll stake your credibility on. Never let a target silently overwrite an estimate.

## Workflow

```
- [ ] 1. Clarify scope and the definition of done (incl. tests, rollout, docs)
- [ ] 2. Decompose into tasks small enough to reason about (ideally < ~1 week each)
- [ ] 3. Estimate each task as a range; flag the unknowns explicitly
- [ ] 4. Attack the biggest unknowns first (spike/prototype to buy information)
- [ ] 5. Add explicit buffer for integration, review, unknowns — don't hide it
- [ ] 6. Sequence by dependency and risk; define milestones
- [ ] 7. State assumptions and what would change the estimate
```

## Decompose until it's knowable

If a task is more than ~1 week or you cannot picture how you'd do it, it is too big to estimate — break it down or **spike** it (a timeboxed investigation whose only deliverable is a better estimate). A plan built on a handful of large, vague blocks is a plan built on hope.

## Account for what people forget

The code is often the smallest part. Explicitly size:

- Testing, code review, and rework
- Integration and the "glue" between components
- Migrations, backfills, and rollout/rollback
- Ambiguity resolution and cross-team dependencies (the top schedule killer)
- The unglamorous last 20% (edge cases, error handling, polish)

## Sequencing & milestones

- **De-risk early:** schedule the most uncertain or dependency-blocked work first, while there is still time to react.
- **Milestones are demonstrable outcomes**, not calendar dates ("checkout works end-to-end in staging"), so progress is observable, not self-reported.
- **Prefer thin vertical slices** that deliver value incrementally over horizontal layers that only pay off at the end.
- Track against the plan and **re-forecast** as you learn — an estimate you never update is a wish.

## Communicating the estimate

- Give a **range with a confidence level** and the assumptions behind it.
- Name the **top risks** and what would move the date in either direction.
- If asked to hit a fixed date, negotiate **scope**, not physics: what ships by then, what slips. (See the `writing-for-executives` skill for framing this to leadership.)

## Anti-patterns

- Single-number estimates presented as certainty.
- Padding secretly instead of stating buffer and its rationale.
- Estimating only the code and forgetting testing, integration, and rollout.
- Treating a business target as if it were an engineering estimate.
- Anchoring the team to the first number said out loud.
- A plan of five giant tasks with no decomposition — false confidence.
- Committing to a date before the biggest unknowns are investigated.
