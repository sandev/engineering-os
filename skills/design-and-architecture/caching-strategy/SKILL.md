---
name: caching-strategy
description: Add caching that speeds up a system without serving stale or wrong data — choosing what to cache, where, how it expires, and how it's invalidated. Use when introducing or reviewing a cache, debugging stale data, or deciding whether caching is the right fix for a performance problem.
---

# Caching Strategy

A cache trades freshness and complexity for speed. Done well it removes load and latency; done carelessly it serves wrong data, hides the real bottleneck, and creates bugs that only appear under load. The two hard questions are always **when does it expire?** and **how is it invalidated?** — decide both before you add one.

## First, is a cache the right fix?

Caching is a powerful painkiller that can mask the disease. Before adding one, understand *why* it's slow — an unindexed query, an N+1, or a bad data model is often better fixed at the source (see the `data-modeling` skill). Cache when the data is **read far more than it changes**, the source is genuinely expensive, and some staleness is acceptable. If you need always-fresh data, a cache is the wrong tool.

## Where to cache (closer = faster, staler, harder to invalidate)

- **Client / browser** — fastest, but you can't invalidate it; control with short TTLs and versioned URLs.
- **CDN / edge** — great for static and cacheable responses near users.
- **Application in-memory** — nanoseconds, but per-instance (inconsistent across nodes) and lost on restart.
- **Distributed cache (Redis/Memcached)** — shared across instances; the common default for app-level caching.
- **Database / query cache** — closest to the source of truth.

Cache at the layer that removes the most work for the least staleness risk; don't cache at every layer "just in case" — each layer multiplies invalidation complexity.

## Expiry and invalidation

Every cached entry needs a defined end of life. Pick deliberately:

- **TTL (time-based):** simplest and safest default — data can be stale up to the TTL. Tune the TTL to how much staleness the use case tolerates.
- **Write-through / write-behind:** update the cache when you update the source, so reads stay fresh.
- **Explicit invalidation:** delete/refresh the key on the event that changes the data. Powerful but easy to miss a path — every writer must remember, or you serve stale data forever.

Prefer TTL (optionally + explicit invalidation) over invalidation alone; a bounded staleness window is a safety net for the invalidation you forgot.

## Failure modes to design for

- **Stampede / thundering herd:** when a hot key expires, many requests miss at once and hammer the source. Mitigate with request coalescing (single-flight), staggered/jittered TTLs, or serving stale while one worker refreshes.
- **Cache penetration:** repeated misses for nonexistent keys pass straight through — cache the "not found" too.
- **Stale after write:** the classic bug — reads see old data because a write path didn't invalidate. Map every write to what it must invalidate.
- **Cache as system-of-record:** a cache is not durable storage; the source must be able to repopulate it. The system must work (slower) with a cold or down cache.
- **Unbounded growth:** set a max size and eviction policy (usually LRU).

## Correctness

- Never cache **per-user or authorized** data under a shared key — a cache-key bug becomes a data leak. Scope keys by identity/permissions.
- Design keys to be specific and collision-free; include the version of the data shape so a deploy doesn't serve incompatible cached objects.

## Anti-patterns

- Adding a cache to mask a fixable slow query or bad schema.
- A cache with no expiry or invalidation plan ("we'll clear it manually").
- Invalidation-only strategy with no TTL safety net.
- Ignoring the stampede on a hot key's expiry.
- Treating the cache as durable — no plan for a cold/failed cache.
- Caching user-specific data under a shared key (data leak).
- Caching everywhere, multiplying staleness bugs across layers.
