---
name: testing-strategy
description: Decide what to test, at which level, and how — so tests catch real defects, run fast, and don't rot. Use when designing a test suite, deciding unit vs integration vs end-to-end coverage, dealing with flaky or slow tests, or judging whether a change is adequately tested.
---

# Testing Strategy

Tests exist to let you change code with confidence. A good suite catches the defects that matter, runs fast enough to run constantly, and fails only when something is actually wrong. Coverage percentage is a means, never the goal — 100% coverage of the wrong things still ships bugs.

## Test the behavior, not the implementation

Assert on observable behavior and public contracts, not internal structure. Tests coupled to implementation break on every refactor and provide false friction; tests coupled to behavior survive refactors and actually protect you. If a test breaks when you refactor without changing behavior, it was testing the wrong thing.

## Choose the right level (the pyramid)

Favor many fast, focused tests and few slow, broad ones:

- **Unit** — a single function/module in isolation. Fast, deterministic, numerous. The bulk of your suite.
- **Integration** — components working together (code + DB, service + service). Fewer; catch wiring and contract mistakes units miss.
- **End-to-end** — a full user journey through the real system. Fewest; slow and flakier, so reserve for critical paths only.

The wrong shape (an "ice-cream cone" — mostly E2E) is slow, flaky, and expensive to maintain. Push coverage down to the cheapest level that can catch the defect.

## What deserves a test

- Core business logic and anything handling money, auth, or data integrity.
- Edge cases and boundaries: empty, null, zero, max, negative, unicode, concurrency.
- Every bug you fix — add a regression test that fails before the fix and passes after.
- Error paths, not just the happy path.

Don't chase coverage on trivial code (getters, framework glue); do ensure the risky 20% is thoroughly covered.

## Qualities of a healthy suite

- **Fast** — the suite runs often only if it's quick; slow tests get skipped.
- **Deterministic** — no dependence on time, ordering, network, or randomness. Flaky tests are worse than no tests: they train people to ignore red.
- **Isolated** — tests don't share mutable state and can run in any order / in parallel.
- **Readable** — a failing test names what broke. Arrange-Act-Assert; one reason to fail per test.
- **Independent of internals** — mock at architectural boundaries (I/O, external services), not every collaborator, or tests become change-detectors.

## Flaky tests

A flaky test is a bug in the test or the system — treat it as such. Quarantine it immediately so it stops eroding trust in the suite, then fix or delete it. Never "just re-run CI" as a habit; that normalizes ignoring failures.

## In practice

- Run the fast tests locally and on every PR; gate merge on green (see the `code-review` skill).
- Write the test at the level that most cheaply pins the behavior you care about.
- When a bug escapes to production, the postmortem action is often a missing test at the right level (see the `incident-postmortem` skill).

## Anti-patterns

- Coverage percentage as a target — it optimizes for testing easy code, not risky code.
- Mostly end-to-end tests (slow, flaky, vague failures).
- Tests coupled to implementation that break on every refactor.
- Tolerating flaky tests / reflexively re-running CI until green.
- Testing only the happy path.
- One giant test asserting twenty things — you can't tell what broke.
- Deleting a failing test to make the build pass.
