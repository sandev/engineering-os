# engineering-os

[![Validate skills](https://github.com/sandev/engineering-os/actions/workflows/validate-skills.yml/badge.svg)](https://github.com/sandev/engineering-os/actions/workflows/validate-skills.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

Engineering OS is a curated collection of battle-tested playbooks, architecture
patterns, leadership principles, and practical guides for engineers, architects,
engineering managers, and technology leaders.

The goal isn't to document everything.

It's to capture what repeatedly works.

Each playbook is a plain-markdown **skill**: a focused, opinionated guide for one
recurring task, with a checklist, a template, and the anti-patterns to avoid. It
reads in five minutes, or you can hand it to any LLM to do the work well.

## Philosophy

- **Principles over frameworks**
- **Playbooks over documentation**
- **Systems thinking over buzzwords**
- **Practicality over theory**

## Vision

Engineering OS aims to become the engineering equivalent of:

- The System Design Primer
- The Phoenix Project
- Google's SRE Book

…updated for the era of AI agents, LLMs, robotics, and modern engineering
organizations.

## The skills

Grouped by what you're doing. Each group is a subfolder of `skills/`.

### Design & architecture

| Skill | Use it when you need to… |
|-------|--------------------------|
| [architecture-decision-records](skills/design-and-architecture/architecture-decision-records/SKILL.md) | Write down a big, hard-to-reverse decision so people understand it later |
| [system-design-review](skills/design-and-architecture/system-design-review/SKILL.md) | Pressure-test a system design before you build it |
| [api-design](skills/design-and-architecture/api-design/SKILL.md) | Design or review an API/contract that's clear and hard to misuse |
| [data-modeling](skills/design-and-architecture/data-modeling/SKILL.md) | Design a schema that fits access patterns and stays correct at scale |
| [caching-strategy](skills/design-and-architecture/caching-strategy/SKILL.md) | Add caching that speeds things up without serving stale or wrong data |
| [security-threat-modeling](skills/design-and-architecture/security-threat-modeling/SKILL.md) | Find what could go wrong security-wise before attackers do |

### AI & agentic systems

| Skill | Use it when you need to… |
|-------|--------------------------|
| [agentic-system-design](skills/ai-and-agentic-systems/agentic-system-design/SKILL.md) | Build an LLM/agent feature that's actually reliable, not just a demo |

### Building & delivering

| Skill | Use it when you need to… |
|-------|--------------------------|
| [technical-design-doc](skills/building-and-delivering/technical-design-doc/SKILL.md) | Plan a non-trivial project and get aligned (RFC / design doc) |
| [estimation-and-planning](skills/building-and-delivering/estimation-and-planning/SKILL.md) | Size work honestly and turn it into a credible, sequenced plan |
| [testing-strategy](skills/building-and-delivering/testing-strategy/SKILL.md) | Decide what to test and at which level so tests catch real defects |
| [code-review](skills/building-and-delivering/code-review/SKILL.md) | Review a pull request with high signal and less nitpicking |
| [debugging](skills/building-and-delivering/debugging/SKILL.md) | Find a bug's root cause systematically instead of guessing |
| [technical-writing](skills/building-and-delivering/technical-writing/SKILL.md) | Write docs and READMEs organized around what the reader needs to do |

### Operating & reliability

| Skill | Use it when you need to… |
|-------|--------------------------|
| [observability-and-slos](skills/operating-and-reliability/observability-and-slos/SKILL.md) | Instrument a system and set reliability targets that alert on real user pain |
| [incident-postmortem](skills/operating-and-reliability/incident-postmortem/SKILL.md) | Run an incident and write a blameless postmortem that sticks |

### Strategy & communication

| Skill | Use it when you need to… |
|-------|--------------------------|
| [technical-strategy](skills/strategy-and-communication/technical-strategy/SKILL.md) | Set technical direction and decide what to build, fix, or defer |
| [decision-making](skills/strategy-and-communication/decision-making/SKILL.md) | Make and drive a decision under uncertainty without stalling |
| [writing-for-executives](skills/strategy-and-communication/writing-for-executives/SKILL.md) | Explain a technical decision to leadership without losing them |

### Leading people & teams

| Skill | Use it when you need to… |
|-------|--------------------------|
| [feedback-and-1-1s](skills/leading-people-and-teams/feedback-and-1-1s/SKILL.md) | Give clear, kind feedback and run 1:1s that build trust and growth |
| [delegation](skills/leading-people-and-teams/delegation/SKILL.md) | Hand off work so it's done well and people grow, without micromanaging |
| [interviewing](skills/leading-people-and-teams/interviewing/SKILL.md) | Run structured interviews that produce real hiring signal, fairly |
| [running-effective-meetings](skills/leading-people-and-teams/running-effective-meetings/SKILL.md) | Run a meeting (all-hands, decision, review) that's worth the time, or skip it |
| [agile-ceremonies](skills/leading-people-and-teams/agile-ceremonies/SKILL.md) | Make standups, planning, demos, and retros create value, not ritual |

## How to use it

Pick whatever fits how you work:

- **Reading:** open any `SKILL.md` and follow the checklist or template. That's it.
- **Any AI chat (ChatGPT, Claude, Gemini, …):** paste the relevant `SKILL.md`
  into the chat, then ask your question. The skill becomes focused instructions
  for that task.
- **Cursor:** run `ln -s ../skills .cursor/skills` once, then the skills
  auto-load and asking *"review this system design"* pulls in the right one.
- **Claude / Agent Skills tools:** point them at the `skills/` folder; the
  frontmatter format matches.
- **Your own agent:** index `skills/`, route on each skill's `description`, load
  the match into context.

## Try it in 30 seconds

```bash
git clone https://github.com/sandev/engineering-os.git
cd engineering-os
# open skills/building-and-delivering/code-review/SKILL.md, or paste it into an AI and say
# "review this diff using this skill"
```

## What this is (and isn't)

- **Is:** durable judgment for common engineering work, kept short and honest.
- **Isn't:** a tutorial for a specific language, tool, or vendor. The advice is
  meant to outlive any given stack.

If a skill ever reads like filler or a product pitch, that's a bug. Open an issue or PR.

## Contributing

New skills and sharper edits are both welcome. See
[CONTRIBUTING.md](CONTRIBUTING.md) for the quick path and
[AGENTS.md](AGENTS.md) for the full format, quality bar, and workflow. Please
be a good neighbor: we follow a [Code of Conduct](CODE_OF_CONDUCT.md). To
report a security concern, see [SECURITY.md](SECURITY.md).

## License

[MIT](LICENSE). Use it, adapt it, share it.
