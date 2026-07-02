---
name: technical-design-doc
description: Write a technical design document (RFC) that frames a problem, presents options with trade-offs, and proposes a solution for review. Use when the user needs to plan a non-trivial project, write an RFC or design doc, or get alignment before building.
---

# Technical Design Doc (RFC)

A design doc exists to **think before building** and to **get aligned** with reviewers. Its value is in the problem framing and the options analysis — not in describing the solution you already picked. If the answer is obvious, you may not need a doc; if it is not, the doc is where the disagreement gets resolved cheaply, on paper.

## When to write one

Write a design doc when work is **non-trivial and uncertain**: it spans multiple weeks or people, has meaningful trade-offs, touches shared systems, or is hard to reverse. Skip it for small, well-understood changes.

## The most important rule

**Spend most of your effort on the problem and the options, not the solution.** Reviewers can only give useful feedback if they understand the problem and see the alternatives you rejected. A doc that jumps straight to "here's what I'm building" hides the decisions that actually matter.

## Structure

```markdown
# <Title>

- Author(s): ...
- Status: Draft | In review | Approved | Implemented
- Reviewers: ...
- Last updated: YYYY-MM-DD

## 1. Summary
Two or three sentences. What problem, what solution, what it costs.
A reader should grasp the whole doc from this alone.

## 2. Context & problem
What is true today, and why is it a problem now? Who is affected and how
much? Quantify where possible. This section contains no solutions.

## 3. Goals and non-goals
- Goals: what success looks like, ideally measurable.
- Non-goals: what this explicitly does NOT try to solve. This is where
  scope creep goes to die.

## 4. Requirements & constraints
Functional needs, non-functional targets (scale, latency, availability),
deadlines, budget, and constraints (existing systems, team, compliance).

## 5. Proposed solution
The recommended approach, at a level a reviewer can evaluate. Diagrams for
data flow and components. Data model and API/contract changes. Enough
detail to find the hard parts — not every line of code.

## 6. Alternatives considered
Two or more real alternatives, each with pros, cons, and why it was not
chosen. "Do nothing" is always a valid alternative to include.

## 7. Cross-cutting concerns
Security & privacy, reliability & failure modes, observability, rollout &
migration (including rollback), cost, and testing/eval strategy.

## 8. Risks & open questions
Honest list of what could go wrong and what is still undecided.

## 9. Rollout plan
Phases, feature flags, migration steps, and how you will know it worked.
```

## Quality bar

- The **summary** stands alone — a busy reviewer or exec understands the decision from it.
- **Goals are measurable** and **non-goals are explicit.**
- At least one credible **alternative** is analyzed, not strawmanned.
- **Failure modes, rollback, and observability** are addressed, not deferred.
- Open questions are stated honestly rather than hidden.

## Working with reviewers

- Circulate as a **Draft** and ask for the *kind* of feedback you want (directional vs detailed).
- Capture decisions and disagreements inline; resolve major objections before moving to Approved.
- For one-way-door decisions inside the doc, spin out an ADR (see the `architecture-decision-records` skill).
- Keep the doc as the living source of truth until implementation; then mark it `Implemented`.

## Anti-patterns

- Writing the doc *after* building to rubber-stamp a decision.
- All solution, no problem framing.
- Strawman alternatives that exist only to make the choice look inevitable.
- Vague goals ("make it better", "improve performance") with no target number.
- Ignoring rollback, migration, and what happens when it breaks.
