# engineering-os

Battle-tested engineering playbooks you can read in five minutes — or hand to an
AI agent to do the work well.

Each playbook is a plain-markdown **skill**: a focused, opinionated guide for one
recurring engineering task, with a checklist, a template, and the anti-patterns
to avoid. They cover software architecture, AI and agentic systems, product
engineering, and technical leadership.

No framework, no signup, no lock-in. It's just markdown that works for a person
reading it or any LLM you paste it into.

## The skills

| Skill | Use it when you need to… |
|-------|--------------------------|
| [architecture-decision-records](skills/architecture-decision-records/SKILL.md) | Write down a big, hard-to-reverse decision so people understand it later |
| [system-design-review](skills/system-design-review/SKILL.md) | Pressure-test a system design before you build it |
| [api-design](skills/api-design/SKILL.md) | Design or review an API/contract that's clear and hard to misuse |
| [security-threat-modeling](skills/security-threat-modeling/SKILL.md) | Find what could go wrong security-wise before attackers do |
| [agentic-system-design](skills/agentic-system-design/SKILL.md) | Build an LLM/agent feature that's actually reliable, not just a demo |
| [technical-design-doc](skills/technical-design-doc/SKILL.md) | Plan a non-trivial project and get aligned (RFC / design doc) |
| [estimation-and-planning](skills/estimation-and-planning/SKILL.md) | Size work honestly and turn it into a credible, sequenced plan |
| [testing-strategy](skills/testing-strategy/SKILL.md) | Decide what to test and at which level so tests catch real defects |
| [code-review](skills/code-review/SKILL.md) | Review a pull request with high signal and less nitpicking |
| [debugging](skills/debugging/SKILL.md) | Find a bug's root cause systematically instead of guessing |
| [observability-and-slos](skills/observability-and-slos/SKILL.md) | Instrument a system and set reliability targets that alert on real user pain |
| [incident-postmortem](skills/incident-postmortem/SKILL.md) | Run an incident and write a blameless postmortem that sticks |
| [technical-strategy](skills/technical-strategy/SKILL.md) | Set technical direction and decide what to build, fix, or defer |
| [decision-making](skills/decision-making/SKILL.md) | Make and drive a decision under uncertainty without stalling |
| [writing-for-executives](skills/writing-for-executives/SKILL.md) | Explain a technical decision to leadership without losing them |
| [feedback-and-1-1s](skills/feedback-and-1-1s/SKILL.md) | Give clear, kind feedback and run 1:1s that build trust and growth |
| [interviewing](skills/interviewing/SKILL.md) | Run structured interviews that produce real hiring signal, fairly |

## How to use it

Pick whatever fits how you work:

- **Reading:** open any `SKILL.md` and follow the checklist or template. That's it.
- **Any AI chat (ChatGPT, Claude, Gemini, …):** paste the relevant `SKILL.md`
  into the chat, then ask your question. The skill becomes focused instructions
  for that task.
- **Cursor:** run `ln -s ../skills .cursor/skills` once, then the skills
  auto-load and asking *"review this system design"* pulls in the right one.
- **Claude / Agent Skills tools:** point them at the `skills/` folder — the
  frontmatter format matches.
- **Your own agent:** index `skills/`, route on each skill's `description`, load
  the match into context.

## Try it in 30 seconds

```bash
git clone https://github.com/sandev/engineering-os.git
cd engineering-os
# open skills/code-review/SKILL.md, or paste it into your favorite AI and say
# "review this diff using this skill"
```

## What this is (and isn't)

- **Is:** durable judgment for common engineering work, kept short and honest.
- **Isn't:** a tutorial for a specific language, tool, or vendor. The advice is
  meant to outlive any given stack.

If a skill ever reads like filler or a product pitch, that's a bug — open an issue or PR.

## Contributing

New skills and sharper edits are both welcome. [AGENTS.md](AGENTS.md) has the
format, the quality bar, and a five-minute path from clone to PR.

## License

[MIT](LICENSE) — use it, adapt it, share it.
