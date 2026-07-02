# Contributing to engineering-os

**engineering-os** is a library of engineering playbooks — for software
architecture, AI and agentic systems, product engineering, and technical
leadership. Each playbook is a plain-markdown **skill** that a human can read in
a few minutes and that an LLM or coding agent can load to do the work well.

This file is also the entry point agents read for repo conventions (the
[`AGENTS.md`](https://agents.md) convention). It works with any tool — Cursor,
Claude, ChatGPT, Copilot, a homegrown agent, or no tool at all.

---

## Quick start (5 minutes)

```bash
git clone https://github.com/sandev/engineering-os.git
cd engineering-os
```

1. **Browse** [`skills/`](skills/) — each folder is one skill, one `SKILL.md`.
2. **Read one** end to end, e.g. `skills/code-review/SKILL.md`, to feel the style.
3. **Use it** (see [Using these skills](#using-these-skills) below).
4. **Contribute** — copy the template, fill it in, open a PR.

No build, no dependencies. It's just markdown.

---

## Using these skills

The format is deliberately portable. Pick whatever matches your tool:

- **Any LLM chat (ChatGPT, Claude, Gemini, etc.):** paste the relevant
  `SKILL.md` into the conversation, then ask your question. The skill acts as
  focused instructions for that task.
- **Cursor:** Cursor auto-discovers skills from `.cursor/skills/`. Create a
  one-time symlink so it picks these up without duplicating anything:
  `ln -s ../skills .cursor/skills`. Then asking *"review this system design"*
  activates the matching skill automatically.
- **Claude / Agent Skills–compatible tools:** the `name` + `description`
  frontmatter matches the Agent Skills format; point the tool at `skills/`.
- **Custom agents / RAG:** index the `skills/` directory. Route on the
  `description` field, then load the matching `SKILL.md` into context.
- **Humans:** just read the file. Each one is a self-contained playbook with a
  checklist or template you can follow directly.

The only hard dependency is the ability to read a markdown file — nothing is
tied to a specific vendor.

---

## Repository layout

```
engineering-os/
├── AGENTS.md                     # you are here — contributor + usage guide
├── README.md                     # what this is + the skill catalog
├── LICENSE
├── scripts/
│   └── validate_skills.sh        # quality-bar checks (run locally + in CI)
├── .github/
│   ├── workflows/validate-skills.yml
│   └── pull_request_template.md
└── skills/                       # the library (tool-neutral source of truth)
    ├── architecture-decision-records/   # design & architecture
    │   └── SKILL.md
    ├── system-design-review/
    ├── api-design/
    ├── data-modeling/
    ├── caching-strategy/
    ├── security-threat-modeling/
    ├── agentic-system-design/           # AI & agentic systems
    ├── technical-design-doc/            # building & delivering
    ├── estimation-and-planning/
    ├── testing-strategy/
    ├── code-review/
    ├── debugging/
    ├── technical-writing/
    ├── observability-and-slos/          # operating & reliability
    ├── incident-postmortem/
    ├── technical-strategy/              # strategy & communication
    ├── decision-making/
    ├── writing-for-executives/
    ├── feedback-and-1-1s/               # leading people & teams
    ├── delegation/
    ├── interviewing/
    ├── running-effective-meetings/
    └── agile-ceremonies/

The groups above are a reading aid only; the directory is flat (one folder per
skill) so tools discover each `skills/<name>/SKILL.md` directly.
```

> The repo is vendor-neutral — there are no tool-specific files. Cursor users can
> opt in with a single symlink (see [Using these skills](#using-these-skills)).

Each skill is a directory with a required `SKILL.md`, plus optional
`reference.md`, `examples.md`, or a `scripts/` folder for anything the main file
shouldn't carry inline.

---

## What makes a good skill here

The bar is high because this library is used broadly. A good skill is:

- **Durable** — principles and judgment that stay true across years and stacks,
  not a tutorial for this week's tool.
- **Actionable** — the reader finishes knowing *what to do*, with a checklist,
  template, and quality bar — not just theory.
- **Opinionated** — takes a clear stance and names anti-patterns. A skill that
  says "it depends" everywhere teaches nothing.
- **Tool-neutral** — no vendor-specific instructions in the skill body. Guidance
  should apply whether the reader is a person or any agent.
- **Concise** — earns every line. Keep `SKILL.md` under ~500 lines; push deep
  material into a linked `reference.md`.
- **Non-overlapping** — extend or cross-link an existing skill instead of
  duplicating it.

If it reads like a vendor doc or a blog post, it isn't ready.

---

## Skill anatomy

Every skill is a `SKILL.md` with YAML frontmatter and a markdown body.

```markdown
---
name: your-skill-name
description: What the skill does AND when to use it, in the third person. This is how a tool or reader decides to load it — be specific and include trigger terms.
---

# Your Skill Name

Short framing: why this matters and the core principle.

## <Workflow / checklist / template / quality bar>

Concrete, actionable guidance.

## Anti-patterns

What to avoid, and why.
```

### Frontmatter rules

| Field | Requirement |
|-------|-------------|
| `name` | Lowercase letters, numbers, hyphens only. Max 64 chars. Must match the folder name. |
| `description` | Non-empty, max 1024 chars. Third person. State **what** it does and **when** to use it, with trigger terms. |

Keep the frontmatter to these two fields so it stays portable across tools. The
`description` is the most important line — it's what makes the skill
discoverable. Write it like the existing skills: `"<what it does>. Use when
<trigger scenarios>."`

### Writing guidance

- **Third person** in the description ("Reviews code…") — many tools inject it
  into a system prompt.
- **Assume a smart reader.** Add only what they wouldn't already know; cut
  generic background.
- **Prefer checklists, templates, and tables** over prose.
- **Show, don't tell** — include a concrete example and a bad-vs-good contrast
  where it helps.
- **No tool-specific or time-sensitive content** ("in Cursor…", "as of 2026…").
  If something is deprecated, put it in an "old patterns" section.
- **Consistent terminology** — one term per concept, used throughout.
- **Cross-link** related skills by name (e.g. "see the
  `architecture-decision-records` skill").

---

## Adding a new skill

```
- [ ] 1. Pick a specific, descriptive name (kebab-case). Not `helper` or `utils`.
- [ ] 2. Create skills/<name>/SKILL.md from the template above.
- [ ] 3. Write a specific, third-person description with clear WHEN triggers.
- [ ] 4. Keep the body under ~500 lines; link a reference.md for depth.
- [ ] 5. Add the skill to the catalog table in README.md.
- [ ] 6. Self-review against "What makes a good skill" and the PR checklist.
- [ ] 7. Run `./scripts/validate_skills.sh`, then open a PR (see below).
```

## Editing an existing skill

Improvements are very welcome — sharper checklists, better examples, a missing
anti-pattern. Keep edits in the established voice and structure. If you're
changing the *meaning* of guidance (not just clarifying), explain the reasoning
in your PR so reviewers can weigh it.

---

## Submitting a change (branch → PR → merge)

We don't commit to `main` directly — every change goes through a PR so it gets
review and passes CI.

```bash
git checkout -b <type>/<short-name>     # e.g. skill/testing-strategy, fix/adr-typo
# ...make your change...
./scripts/validate_skills.sh            # must pass before you push
git commit -am "Concise, why-focused message"
git push -u origin HEAD
gh pr create                            # fill in the PR template
```

CI (`.github/workflows/validate-skills.yml`) runs the same
`validate_skills.sh` on every PR: it checks frontmatter, that each `name`
matches its folder, the 500-line limit, and that README links resolve. A green
local run means a green CI. Merge once CI passes and a reviewer approves.

---

## Pull request checklist

- [ ] `name` is kebab-case and matches the folder name
- [ ] `description` is third person and includes both **what** and **when**
- [ ] Body is under ~500 lines; deep material is in a linked file
- [ ] Tool-neutral, consistent terminology, no time-sensitive claims
- [ ] Includes actionable structure (checklist / template / quality bar) and an anti-patterns section
- [ ] README catalog updated if you added a skill
- [ ] Cross-links to related skills use the exact skill name
- [ ] `./scripts/validate_skills.sh` passes locally

**PR description:** state what the skill/change is, who it's for, and why the
guidance is sound (experience, sources, or precedent). We review for accuracy,
clarity, and durability — the same bar as the skills themselves.

---

## Review principles

Reviewers optimize for the person or agent who will rely on this in a real
decision. We merge changes that are correct, concise, and genuinely useful, and
push back on anything vague, redundant, or vendor-specific. Disagreement is
settled on the merits, in the open, in the PR. Be kind, be specific, attack the
text not the author — the standards in the `code-review` skill apply to us too.
