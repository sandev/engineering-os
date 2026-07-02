---
name: api-design
description: Design and review APIs (HTTP/REST, RPC, or library interfaces) that are clear, consistent, evolvable, and hard to misuse. Use when defining a new endpoint or service contract, designing a public interface or SDK, reviewing an API, or planning how an API will version and change.
---

# API Design

An API is a contract and a one-way door: once others depend on it, changing it is expensive and often impossible without breaking them. Design it for the **caller**, make the easy thing correct and the wrong thing hard, and assume it will outlive the code behind it.

## First principles

- **Design for the consumer, not the implementation.** The API should express the caller's intent, not leak your database schema or internal structure.
- **Consistency over cleverness.** Predictable naming, error shapes, and conventions let a caller guess correctly. One surprising endpoint taxes every integration.
- **Make illegal states unrepresentable.** Prefer types/enums/required fields over free-form strings and "remember to also set X." The compiler and the schema should catch misuse.
- **Small surface area.** Every field, endpoint, and option is a forever commitment. Expose the minimum; you can always add, rarely remove.

## Design checklist

```
- [ ] Model the resources/operations around the caller's use cases
- [ ] Consistent naming, pluralization, and casing throughout
- [ ] Explicit request/response schemas; required vs optional is deliberate
- [ ] Standard, structured error format with actionable messages + codes
- [ ] Pagination, filtering, and sorting for any list that can grow
- [ ] Idempotency for retriable/mutating operations
- [ ] AuthN/AuthZ and rate limits defined at the boundary
- [ ] Versioning and deprecation strategy decided up front
- [ ] Documented with examples for every operation
```

## Contracts & correctness

- **Explicit schemas.** Define request and response shapes precisely (types, required fields, formats). Validate input at the boundary and reject clearly.
- **Idempotency.** Make retries safe — use idempotency keys or PUT-style semantics for mutations, so a client that times out and retries doesn't double-charge or double-create.
- **Pagination by default.** Any collection that can grow must be paged (prefer cursor-based over offset for stability). Never return unbounded lists.
- **Time, money, and IDs:** use unambiguous types — ISO-8601 with timezone, integer minor units or decimal strings for currency, opaque string IDs (don't leak sequential internals).

## Errors

Callers program against your errors as much as your successes.

- Use a **consistent, structured error body** (stable machine-readable `code`, human-readable `message`, and where relevant a `details`/field-error list).
- Use status codes/categories correctly: client error (4xx) vs server error (5xx); don't return `200` with an error inside.
- Messages should say **what went wrong and how to fix it**, never leak internals or secrets.

## Evolution & versioning

APIs change; plan for it so you never have to break callers:

- **Additive changes are safe** (new optional fields, new endpoints). **Removing or renaming fields, tightening validation, or changing semantics are breaking** — treat them as a new version.
- Decide the versioning approach up front (URL version, header, or content negotiation) and be consistent.
- Never repurpose an existing field's meaning. Clients tolerate new fields; they break on changed ones.
- Have a **deprecation path**: announce, provide a migration window and overlap, measure remaining usage, then remove. Record one-way-door choices as an ADR (see the `architecture-decision-records` skill).

## Anti-patterns

- Leaking the database schema or internal model straight through the API.
- Inconsistent naming/error shapes across endpoints.
- Booleans that should have been enums (they never stay binary).
- Unbounded list endpoints with no pagination.
- Overloading one endpoint with a `mode`/`type` flag that changes its behavior.
- Breaking changes shipped in place instead of a new version.
- Non-idempotent mutations that make client retries dangerous.
- Chatty designs that force N calls for one use case (or god-endpoints that do everything).
