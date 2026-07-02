---
name: code-review
description: Perform a high-signal code review focused on correctness, design, security, and maintainability, and deliver feedback that is clear and prioritized. Use when reviewing a pull request, examining a diff, or when the user asks for a code review.
---

# Code Review

The purpose of review is to keep the codebase healthy and catch defects the author cannot see — not to prove cleverness or enforce personal style. Optimize for **high signal**: a few important comments beat many trivial ones.

## Order of priorities

Review in this order. Do not spend attention on line 4 before you have judged whether the change should exist at all.

1. **Should this change exist?** Does it solve a real problem, match its design/ticket, and belong here?
2. **Correctness.** Does it do what it claims? Edge cases, error paths, concurrency, off-by-one, null/empty, boundary conditions.
3. **Security.** Untrusted input validated? Authz enforced? Secrets/PII handled? Injection (SQL/command/XSS) avoided?
4. **Design & maintainability.** Right abstraction and boundaries? Will the next engineer understand it? Is complexity justified?
5. **Tests.** Do tests cover the new behavior and the failure cases — not just the happy path?
6. **Operational.** Logging, metrics, migrations, rollback, performance under real load.
7. **Style/nits.** Last, and ideally automated by a linter/formatter rather than raised by a human.

## What to focus on

- **Read the description first.** A change you cannot understand the *intent* of is not reviewable — ask.
- **Trace the risky paths**, not every line. Concentrate on logic that handles money, auth, data mutation, and external input.
- **Prefer questions over commands** when intent is unclear: "What happens if `items` is empty here?" surfaces bugs without assuming.
- **Approve when it is a net improvement**, not when it is perfect. Perfect is the enemy of shipped; block only on real problems.

## Comment format

Label severity so the author knows what blocks merge:

- **blocking** — must fix before merge (bug, security hole, data loss, breaks contract).
- **consider** — meaningful improvement; author decides.
- **nit** — trivial/style; explicitly optional.
- **praise** — call out genuinely good work; reviews are not only for problems.
- **question** — you need information to assess.

Each comment should say **what**, **why it matters**, and ideally **a suggested direction**. Attack the code, never the author.

<example>
blocking: If `user` is null here (possible when the session expired mid-request),
this dereferences null and 500s. Guard it and return 401, or document why it
can't be null.
</example>

<example>
nit (optional): this could use `Array.prototype.at(-1)` for readability.
</example>

## Security quick checklist

- [ ] All external input validated and bounds-checked
- [ ] Authorization checked at the boundary (not assumed from the caller)
- [ ] No secrets, tokens, or PII in code, logs, or error messages
- [ ] Parameterized queries / safe templating (no string-built SQL or HTML)
- [ ] Dependencies are trusted and pinned

## Resolving disagreement

Don't let a PR stall for days in comment ping-pong. If author and reviewer are stuck after a round or two, switch to a synchronous conversation or escalate to a tech lead, decide, and record the reasoning in the thread. Disagreement is settled on technical merit; when it is a genuine judgment call with no clear winner, the author's decision generally stands. Approving means you share ownership of the outcome — review accordingly.

## Anti-patterns for reviewers

- Bikeshedding style while missing a logic bug.
- Blocking on personal preference dressed up as a standard.
- "LGTM" on a large diff you did not actually read — say what you reviewed.
- Rewriting the author's approach in comments instead of discussing the goal.
- Letting a review sit for days; slow reviews stall the whole team.

## As the author (making review easy)

- Keep PRs small and single-purpose; large diffs get shallow reviews.
- Write a description that states the *why* and how to test it.
- Review your own diff first and pre-empt likely questions.
