---
name: agentic-system-design
description: Design reliable LLM and agent-based systems, including tool design, context management, evaluation, guardrails, and failure handling. Use when building an AI agent, LLM feature, RAG pipeline, or agentic workflow, or when the user asks how to make an LLM system reliable, testable, or production-ready.
---

# Agentic System Design

LLM systems fail differently from deterministic software: they are non-deterministic, degrade silently, and fail plausibly. Design for that reality. The discipline that separates a demo from a production agent is **evaluation, guardrails, and scoping** — not prompt cleverness.

## First principle: start with the narrowest useful scope

An agent's reliability drops as its action space grows. Prefer the least-agentic design that solves the problem.

```
Prompt/completion  <  Fixed workflow (chained steps)  <  Router + tools  <  Autonomous agent
        simpler, more reliable  ------------------------------->  more capable, less predictable
```

Reach for a fully autonomous loop only when the task genuinely requires open-ended planning. Most "agent" problems are better served by a structured workflow with a few well-chosen tools.

## Design checklist

```
- [ ] Task scope defined; simplest viable pattern chosen
- [ ] Context strategy defined (what goes in the window, and how it is retrieved)
- [ ] Tools designed with tight contracts and validated inputs/outputs
- [ ] Failure handling: retries, timeouts, fallbacks, human handoff
- [ ] Guardrails on inputs and outputs
- [ ] Evaluation set + metrics defined before shipping
- [ ] Observability: full trace of prompts, tool calls, and decisions
- [ ] Cost and latency budget per request
```

## Context management

The context window is a scarce, expensive resource. Curate it.

- Put only what the model needs for *this* step. More context is not better — it dilutes attention and raises cost.
- For retrieval (RAG): the failure is usually **retrieval quality**, not the model. Measure recall of your retriever independently. Chunk deliberately, include citations, and prefer fewer high-relevance passages.
- Manage long-running state with summaries/scratchpads rather than replaying full history.
- Treat everything retrieved or user-supplied as **untrusted** (see guardrails).

## Tool design

Tools are the agent's API to the world. Design them like a public API.

- **Narrow and specific** beats broad and flexible. `get_order_status(order_id)` not `query_database(sql)`.
- Validate every argument; return **structured, actionable errors** the model can recover from ("order_id not found; ask the user to confirm it").
- Make mutating tools **idempotent** and require explicit confirmation for destructive or irreversible actions.
- Keep the tool count small; too many tools degrade selection accuracy.

## Guardrails

- **Input:** validate and constrain user/tool input. Defend against prompt injection — never let retrieved or user text silently override system instructions. Untrusted content must not be able to escalate the agent's privileges.
- **Output:** validate structure (schema), check for policy violations, and constrain side effects. Do not let raw model output trigger irreversible actions without a check.
- **Authorization:** the agent should act with the *user's* permissions, not the system's. Enforce authz at the tool boundary, not in the prompt.

## Failure handling

Assume every model call and tool call can fail or return garbage.

- Timeouts and bounded retries on model/tool calls; cap total loop iterations to prevent runaway loops.
- Deterministic fallback when confidence is low or a step fails repeatedly (a default response, a simpler path, or a human).
- Design an explicit **human handoff** for cases the agent cannot or should not handle.

## Evaluation — the core discipline

You cannot improve what you cannot measure, and you cannot measure an LLM system with vibes.

1. **Build an eval set early.** Collect representative inputs with known-good outcomes. Grow it from real failures.
2. **Choose metrics that match the task:** exact-match/schema-valid for structured output; task-success rate for agents; retrieval recall for RAG; rubric-based LLM-as-judge for open-ended text (validated against human labels).
3. **Run evals in CI.** Treat a prompt or model change like a code change — gate it on the eval suite.
4. **Watch for regressions** when changing models, prompts, or tools; small changes can shift behavior broadly.

## Observability

Log the full trace for every request: system prompt, retrieved context, each tool call and result, the model's intermediate decisions, tokens, latency, and cost. When an agent misbehaves in production, the trace is the only way to understand why.

## Anti-patterns

- Shipping on demo success with no eval set.
- Giving an agent a broad `execute`/`sql`/`shell` tool "for flexibility."
- Trusting model output to trigger irreversible actions without validation.
- Stuffing the whole knowledge base into context instead of retrieving.
- Unbounded agent loops with no iteration cap or cost budget.
- Treating prompt injection as a theoretical risk when handling untrusted content.
