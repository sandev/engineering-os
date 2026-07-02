---
name: writing-for-executives
description: Turn technical detail into crisp, decision-oriented communication for executives and senior stakeholders. Use when preparing an update, proposal, escalation, or briefing for leadership, or when the user asks to make a technical message clearer for non-technical or busy readers.
---

# Writing for Executives

Executives are time-poor, context-rich in business but not in your system, and are reading to **make or unblock a decision**. Write for a reader who will give you 60 seconds and may stop after the first two sentences. Respect that, and you get trust and faster decisions.

## The one rule: BLUF (Bottom Line Up Front)

Lead with the conclusion, the ask, or the headline — then support it. Never make the reader dig for the point.

<example>
Bad (buries the point):
"Over the last quarter we investigated our data pipeline. We looked at several
vendors and ran benchmarks. The current system has some limitations around
throughput and we've been seeing increased latency..."

Good (BLUF):
"We need to migrate our data pipeline this quarter; delaying risks missing the
Q3 launch SLA. It costs 3 engineer-weeks and ~$40k/yr. I'm asking for approval
to start. Details below."
</example>

## Structure for an executive update or proposal

```markdown
**Ask / headline:** the single thing you want them to know or decide.

**Why it matters (business terms):** impact on revenue, risk, cost, customers,
or timeline — not implementation detail.

**Options & recommendation:** if a decision is needed, 2-3 options with the
trade-off in one line each, and your recommendation.

**What I need:** the specific decision, resource, or unblock — and by when.

**Details / appendix:** the technical depth, for those who want it. Optional
reading, clearly marked.
```

## Principles

- **Translate tech into business impact.** They care about outcomes (revenue, risk, cost, speed, customer trust), not mechanisms. "Migrate to sharded Postgres" → "handle 5x growth without the outages we hit in March."
- **Quantify.** "Slow" is an opinion; "p99 latency is 4s vs our 500ms target" is a fact. Attach numbers to problems, costs, and benefits.
- **Give a recommendation, not just options.** Leaders want your judgment. Present the choice, then say what you would do and why.
- **Be explicit about the ask.** End with the specific decision or resource you need, and the deadline. A message with no clear ask gets no action.
- **Surface risk honestly and early.** Bad news does not improve with age. State the risk, its likelihood/impact, and your mitigation.
- **Ruthless brevity.** One screen. Cut jargon, hedging, and background the reader does not need. If it is not load-bearing, delete it.

## Escalations

When escalating a problem, include all four or you will get bounced back:
1. **What is wrong** and its business impact (quantified).
2. **What you have already tried.**
3. **What you need from them** specifically.
4. **The decision deadline** and what happens if it slips.

## Adjusting for audience

- **Board / CEO:** strategy, money, risk, and customer/market impact. Almost no implementation.
- **VP / Director:** trade-offs, resourcing, timelines, cross-team dependencies.
- **Skip-level / eng leadership:** more technical depth is welcome, but still lead with the decision.

## Anti-patterns

- Burying the ask in paragraph four.
- Jargon and acronyms without a business translation.
- Presenting options with no recommendation ("I'll let you decide").
- Vague, unquantified claims ("performance is bad", "it's risky").
- Hiding or delaying risk to sound optimistic.
- A wall of text where a three-line summary and an appendix would serve.
