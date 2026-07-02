# Security Policy

**engineering-os** is a library of markdown playbooks, it ships no runtime
software or executables that run on your machine, aside from
`scripts/validate_skills.sh` (used for validation in CI). The realistic security
concerns are therefore about the repository and its guidance itself.

## Reporting a vulnerability

If you find any of the following, please report it **privately**: do not open a
public issue:

- A way the repository, its CI workflow, or `scripts/validate_skills.sh` could be
  abused (e.g. a workflow injection or a supply-chain concern).
- Guidance in a skill that is actively unsafe (e.g. advice that would introduce a
  security vulnerability if followed).

**How to report:** use GitHub's private vulnerability reporting on this
repository, **Security → Report a vulnerability** (Security Advisories). If that
is unavailable to you, contact the maintainer through their GitHub profile.

Please include what you found, where, and why it's a concern. We aim to
acknowledge reports within a few business days.

## Scope

- **In scope:** the GitHub Actions workflow, the validation script, and any skill
  content that could cause harm if followed.
- **Out of scope:** general disagreements with a skill's guidance (open a
  correction issue instead) and vulnerabilities in third-party tools you use to
  read these skills.

Thank you for helping keep the project and its readers safe.
