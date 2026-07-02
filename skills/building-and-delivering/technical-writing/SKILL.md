---
name: technical-writing
description: Write clear technical documentation and prose — READMEs, guides, references, and explanations — organized around what the reader needs to do. Use when writing or reviewing docs, a README, an onboarding guide, API/reference docs, or any technical explanation that needs to be understood and acted on.
---

# Technical Writing

Good technical writing gets the reader to understanding or a completed task with the least effort. It is a service to the reader, not a record of everything you know. Write for the person who is busy, lacks your context, and will skim — respect that and your docs get read and trusted.

## Start with the reader and their goal

Before writing, answer: **who is this for, and what do they need to do after reading it?** A tutorial for a newcomer, a reference for an expert, and an explanation of "why" are different documents — don't blend them. Match depth and vocabulary to that reader.

The four documentation types (the Diátaxis split) each serve a distinct need; keep them separate:

- **Tutorial** — learning-oriented; a guided first success for a beginner.
- **How-to guide** — task-oriented; steps to accomplish a specific goal.
- **Reference** — information-oriented; accurate, complete, lookup-friendly (APIs, config, CLI).
- **Explanation** — understanding-oriented; the why, the concepts, the trade-offs.

## Structure for skimming

- **Lead with the point** (BLUF): the most important information first, then detail. Readers decide in seconds whether to keep going.
- **Descriptive headings** so a reader can scan the structure and jump to their part.
- **Short paragraphs, lists, and tables** over walls of prose. One idea per paragraph.
- **Show, don't just tell:** a working, copy-pasteable example is worth paragraphs of description. Make sure examples actually run.
- Put prerequisites and the "happy path" up front; edge cases and deep detail later or in a linked page.

## Write clearly

- **Plain, direct language.** Prefer the simple word; cut jargon or define it on first use. Short sentences.
- **Active voice and present tense:** "the client sends a request," not "a request is sent."
- **Be concrete and specific.** "Fast" and "large" are opinions; give numbers, names, and exact commands.
- **Cut ruthlessly.** Delete throat-clearing, hedging, and anything not load-bearing. If a sentence doesn't help the reader act or understand, remove it.
- **Consistent terminology** — one term per concept throughout; switching words makes readers wonder if you mean something different.

## A good README answers, fast

What is this and who is it for → how to install/run it → a minimal working example → where to go next (deeper docs, contributing). A reader should get to "hello world" without reading everything.

## Keep it true

Docs that lie are worse than no docs — they destroy trust. Keep docs next to the code, update them in the same change, and prefer generating reference material from the source where possible. Delete or clearly mark stale content. When explaining a decision to leadership rather than documenting a system, switch to the `writing-for-executives` skill.

## Anti-patterns

- Writing for yourself instead of the reader; assuming your context.
- Burying the key information under background and preamble.
- Walls of prose with no headings, lists, or examples.
- Vague claims where a number, name, or command belongs.
- Mixing tutorial, reference, and explanation in one document.
- Examples that don't run, or drift out of date with the code.
- Documentation that isn't updated with the change it describes.
