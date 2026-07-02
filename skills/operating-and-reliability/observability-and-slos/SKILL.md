---
name: observability-and-slos
description: Instrument systems and define SLIs, SLOs, and error budgets so reliability is measured from the user's perspective and alerts are actionable. Use when adding metrics/logs/traces, setting reliability targets, designing alerts and dashboards, or deciding what "reliable enough" means for a service.
---

# Observability & SLOs

Observability is the ability to answer *"what is happening and why?"* about a running system, ideally about questions you didn't anticipate. Reliability targets (SLOs) turn "is it healthy?" from an opinion into a measurement, made from the **user's** point of view, not the server's.

## The two jobs

1. **Instrument** so you can debug the unknown, metrics, logs, and traces that let you ask new questions in production.
2. **Define reliability targets** (SLIs/SLOs/error budgets) so you know whether the system is good enough, and alert only when users are actually affected.

## The three signals (use them for different jobs)

- **Metrics**: cheap, aggregate, always-on. Best for *what* is wrong and for alerting (rates, latencies, saturation).
- **Traces**: the path of one request across services. Best for *where* latency or errors originate in a distributed system.
- **Logs**: high-detail events. Best for *why*, once metrics/traces point you at the spot.

Emit **structured** logs (key-value, not prose), propagate a **trace/correlation ID** across every hop, and attach consistent labels so signals can be joined.

## What to measure: the user's experience first

Instrument the **golden signals** for every service:

- **Latency** (as percentiles, p50/p95/p99, never just the average; averages hide the pain).
- **Traffic** (requests/sec, throughput).
- **Errors** (rate and type).
- **Saturation** (how full the constrained resource is: CPU, memory, connections, queue depth).

Measure at the boundary the **user** experiences, not just internal component health. A green CPU dashboard while checkout is failing is worthless.

## SLIs, SLOs, error budgets

- **SLI**: a metric of user-visible health, as a ratio of good events to total ("proportion of requests < 300ms and 2xx/3xx").
- **SLO** (the target for that SLI over a window ("99.9% of requests succeed under 300ms over 28 days"). Set it from what users need, not 100% (100% is the wrong target) it forbids all change and costs infinitely).
- **Error budget**: `1 − SLO`. It is permission to spend: within budget, ship features; when the budget is burning, shift to reliability. This turns reliability-vs-velocity from an argument into a rule.

## Alerting: page on symptoms, not causes

- **Alert on SLO burn / user-facing symptoms**, not on every internal cause (high CPU isn't a problem if users are fine).
- Every page must be **actionable and urgent**: if the responder can't or needn't do anything now, it's a dashboard, not a page.
- Prefer **burn-rate alerts** (budget consumed fast) to static threshold noise.
- Ruthlessly delete alerts that don't lead to action; alert fatigue causes missed incidents.
- When an alert fires, it feeds incident response and postmortems, see the `incident-postmortem` skill.

## Quality bar

- Golden signals exist for each critical service, measured at the user boundary.
- Latency is tracked as **percentiles**, not averages.
- At least one **SLO with an error budget** exists for each critical user journey.
- Every alert is actionable, urgent, and tied to user impact.
- A new engineer can trace a single slow request end-to-end via a correlation ID.

## Anti-patterns

- Averages instead of percentiles (they hide the tail users feel).
- Monitoring machine health (CPU/RAM) while ignoring user-facing success/latency.
- Alerting on causes, producing noise nobody acts on → alert fatigue.
- Unstructured logs you can't query, or no correlation IDs across services.
- A 100% reliability target (or no SLO at all, so "reliable" is just a vibe).
- Logging secrets or PII into your telemetry.
