---
name: data-modeling
description: Design a data model — entities, relationships, keys, and schema — that fits the access patterns and keeps data correct as it grows. Use when designing a database schema, choosing SQL vs NoSQL, deciding normalization or partition keys, or reviewing a data model for correctness and scale.
---

# Data Modeling

The data model outlives the application code and is the most expensive thing to change once it holds production data. Get the model right and most features are easy; get it wrong and every feature fights the schema. Design from the **data's truth** and the **access patterns**, not from the current UI.

## Start from truths and access patterns

- **Model the domain's invariants first:** what entities exist, what relationships are real (1:1, 1:N, N:M), and what must always be true. Encode those truths in the schema so bad states are impossible.
- **Then design for how data is read and written.** List the top queries and mutations up front — the model that's "clean" on paper but needs six joins for your hottest query is the wrong model. In relational design you can normalize first and denormalize deliberately; in NoSQL you design the model *around* the queries from the start.
- **Every entity needs a clear identity and a single source of truth.** Ambiguous ownership of a field is a future data-integrity bug.

## Keys and integrity

- **Primary keys:** stable, unique, and meaningless (surrogate keys — UUID/serial) beat natural keys that can change (email, phone). Never leak sequential internal IDs in public APIs (see the `api-design` skill).
- **Enforce constraints in the database**, not just the app: foreign keys, `NOT NULL`, `UNIQUE`, and `CHECK`. The DB is the last line of defense for correctness; application-only rules get bypassed.
- **Represent state explicitly** with enums/status columns and valid transitions — don't infer state from a tangle of nullable flags.
- **Normalize to remove redundancy**, so one fact lives in one place. Denormalize only for a measured read-performance need, and then own the duplication (keep copies in sync deliberately).

## Choosing a store

Pick the model that matches the shape and access of the data — one surprising default with an escape hatch:

- **Relational (Postgres/MySQL)** is the right default: strong consistency, flexible queries, transactions, and constraints. Choose it unless you have a specific reason not to.
- **Document (Mongo, etc.)** when data is naturally hierarchical, schema varies, and access is by a single key/aggregate.
- **Key-value / wide-column** for massive scale with known, simple access patterns.
- Match the **consistency model** (strong vs eventual) to the requirement — don't accept eventual consistency where correctness needs strong.

## Evolving the schema

Schemas change; plan migrations so they're safe on live data:

- **Additive first, backfill, then switch, then clean up** (expand/contract): add a nullable column, backfill, start writing/reading it, and only later drop the old one. This keeps deploys and rollbacks safe.
- Large backfills and index builds run online and in batches — a blind `ALTER` can lock a hot table and cause an outage.
- Plan for growth: identify the tables that grow unboundedly and their **partitioning/sharding key** (choose one that spreads load and matches queries — avoid hotspots), and define a retention/archival story (see the data-lifecycle point in the `system-design-review` skill).

## Anti-patterns

- Modeling to the current screen instead of the domain's truths and queries.
- Natural/meaningful primary keys that later need to change.
- Integrity enforced only in application code, not the database.
- Booleans and nullable flags standing in for an explicit state machine.
- Premature denormalization (or NoSQL) "for scale" the requirements don't demand.
- Schema changes that lock hot tables or can't be rolled back.
- One giant "junk drawer" table with dozens of nullable, loosely related columns.
