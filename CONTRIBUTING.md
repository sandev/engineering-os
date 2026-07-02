# Contributing

Thanks for helping improve **engineering-os**. Contributions — new skills,
sharper edits, fixes — are welcome.

The full guide (skill format, quality bar, and the branch → PR → merge flow)
lives in **[AGENTS.md](AGENTS.md)**. Start there. The short version:

```bash
git clone https://github.com/sandev/engineering-os.git
cd engineering-os
git checkout -b <type>/<short-name>     # e.g. skill/testing-strategy
# ...make your change...
./scripts/validate_skills.sh            # must pass before you push
git commit -am "Concise, why-focused message"
git push -u origin HEAD
gh pr create                            # fill in the PR template
```

## The bar

A good skill is **durable, actionable, opinionated, tool-neutral, and concise**
(see AGENTS.md → *What makes a good skill*). If it reads like a vendor doc or a
blog post, it isn't ready.

## Before you open a PR

- `name` is kebab-case and matches the folder name.
- `description` is third person and states **what** it does and **when** to use it.
- Body is under ~500 lines; it has actionable structure and an anti-patterns section.
- `./scripts/validate_skills.sh` passes locally (CI runs the same check).
- README catalog updated if you added a skill.

## Questions or ideas?

Open an issue (there are templates for proposing a skill and for corrections).
Not sure if an idea fits? Open an issue first and let's discuss before you write.

By contributing, you agree your work is licensed under the repository's
[MIT License](LICENSE).
