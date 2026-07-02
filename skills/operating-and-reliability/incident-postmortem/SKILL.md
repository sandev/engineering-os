---
name: incident-postmortem
description: Run a production incident and write a blameless postmortem that finds systemic causes and durable action items. Use when there is an active outage or degradation, or when the user needs to write or review a postmortem, RCA, or incident retrospective.
---

# Incident Response & Postmortem

Two jobs: **stop the bleeding** during the incident, then **learn** without blame afterward. The measure of a healthy engineering org is not zero incidents — it is how much it learns from each one.

## Part 1 — During the incident

Priority order is fixed: **mitigate first, diagnose second.** Restoring service beats understanding root cause in the moment.

### Severity (set one from customer impact, not cause)
- **SEV1** — critical: major outage or data loss, broad customer impact. All-hands, leadership notified immediately.
- **SEV2** — significant: partial outage or serious degradation; urgent but contained.
- **SEV3** — minor: limited or cosmetic impact; handle in normal hours.

When unsure, over-declare — you can always downgrade. Severity drives the response, not blame.

### Roles (assign explicitly, even for a team of two)
- **Incident Commander (IC):** owns decisions and coordination. Not the person with hands on keyboard.
- **Ops/hands-on:** investigates and applies fixes.
- **Communications:** updates stakeholders and status page on a cadence.

### Flow
```
- [ ] Declare the incident; assign IC. Set a severity.
- [ ] Open a single coordination channel; all activity goes there.
- [ ] Assess impact: who/what is affected, since when, how badly.
- [ ] Mitigate: roll back, fail over, disable the feature, scale up — buy stability.
- [ ] Communicate on a fixed cadence, even with "no change yet."
- [ ] Once stable, confirm recovery with data, then stand down.
- [ ] Preserve evidence (logs, dashboards, timeline) for the postmortem.
```

Good telemetry is what makes detection fast and root cause findable — see the `observability-and-slos` skill; for the diagnosis itself, see the `debugging` skill.

### Principles
- **Mitigate with the fastest safe lever** (usually rollback) before hunting root cause.
- **One source of truth** for status; avoid parallel side-conversations.
- **Change one thing at a time** and observe; panic-changing multiple variables hides what worked.
- **Over-communicate.** Silence during an outage erodes trust faster than bad news.

## Part 2 — The postmortem (blameless)

Write one for every significant incident, within a few days while memory is fresh.

### Blameless means
Focus on **systems and conditions**, not individuals. "An engineer ran the migration" → "the deploy tooling allowed an unreviewed migration to reach production with no dry-run gate." People act reasonably given the information and tools they had; if a human error caused an outage, the system that *let* that error reach production is the finding. Blame kills the honesty that makes postmortems useful.

### Template
```markdown
# Postmortem: <incident title>

- Date / duration: ...
- Severity & impact: users affected, requests failed, revenue/SLA impact.
- Authors: ...   Status: Draft | Reviewed

## Summary
A few sentences: what broke, the impact, and how it was resolved.

## Timeline (UTC)
- HH:MM — trigger / first symptom
- HH:MM — detected (how? alert or human?)
- HH:MM — key actions and what they did
- HH:MM — mitigated
- HH:MM — fully resolved

## Impact
Quantified: duration, users, requests, data, money.

## Root cause analysis
The chain of contributing causes. Ask "why" until you reach systemic
factors, not a person. Usually several causes combine — capture all.

## What went well / what was hard
Detection, response, tooling, communication — honestly.

## Action items
| Action | Type (prevent/detect/mitigate) | Owner | Due |
|--------|-------------------------------|-------|-----|
Each item is specific, owned, dated, and tracked to completion.
```

### Quality bar
- Root cause reaches a **systemic** factor (process, tooling, design gap), not "human made a mistake."
- **Detection** is examined: did we find it, or did a customer? How fast?
- Action items are **concrete, owned, dated, and tracked** — a postmortem whose actions are never done is theater.
- Prefer actions that **prevent the class** of failure, not just this one instance.
- Tone stays blameless throughout.

## Anti-patterns
- Naming and shaming; "root cause: human error."
- Action items with no owner or date (they never happen).
- Diagnosing root cause while the site is still down.
- Skipping the postmortem because "we know what happened."
- Only fixing the exact bug, ignoring the class of failure and the detection gap.
