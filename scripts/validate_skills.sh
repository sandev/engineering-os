#!/usr/bin/env bash
#
# Validate every skill against the engineering-os quality bar.
# Run locally before opening a PR: ./scripts/validate_skills.sh
# CI runs the same script, so a green local run means a green CI.
#
# Checks per skill (skills/<name>/SKILL.md):
#   - SKILL.md exists
#   - frontmatter has `name` and `description`
#   - `name` is kebab-case, <= 64 chars, and matches the folder name
#   - `description` is non-empty and <= 1024 chars
#   - body is <= 500 lines
# Repo-wide:
#   - every skills/.../SKILL.md linked from README.md exists

set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

fail=0
err() { printf '  \033[31mFAIL\033[0m %s\n' "$1"; fail=1; }
ok()  { printf '  \033[32mok\033[0m   %s\n' "$1"; }

frontmatter_value() {
  # $1 = file, $2 = key. Reads value from the YAML frontmatter block.
  awk -v key="$2" '
    NR==1 && $0=="---" { infm=1; next }
    infm && $0=="---"  { exit }
    infm {
      if (index($0, key ": ") == 1) { print substr($0, length(key)+3); exit }
    }
  ' "$1"
}

echo "Validating skills..."
shopt -s nullglob
found=0
for dir in skills/*/; do
  name_dir="$(basename "$dir")"
  file="${dir}SKILL.md"
  found=$((found+1))

  if [[ ! -f "$file" ]]; then
    err "$name_dir: missing SKILL.md"
    continue
  fi

  if [[ "$(head -1 "$file")" != "---" ]]; then
    err "$name_dir: SKILL.md must start with YAML frontmatter (---)"
    continue
  fi

  name="$(frontmatter_value "$file" name)"
  desc="$(frontmatter_value "$file" description)"

  [[ -n "$name" ]] || err "$name_dir: frontmatter missing 'name'"
  [[ -n "$desc" ]] || err "$name_dir: frontmatter missing 'description'"

  if [[ -n "$name" && "$name" != "$name_dir" ]]; then
    err "$name_dir: frontmatter name '$name' does not match folder '$name_dir'"
  fi
  if [[ -n "$name" && ! "$name" =~ ^[a-z0-9-]+$ ]]; then
    err "$name_dir: name must be kebab-case [a-z0-9-]"
  fi
  if [[ ${#name} -gt 64 ]]; then
    err "$name_dir: name exceeds 64 chars"
  fi
  if [[ ${#desc} -gt 1024 ]]; then
    err "$name_dir: description exceeds 1024 chars (${#desc})"
  fi

  lines="$(wc -l < "$file" | tr -d ' ')"
  if [[ "$lines" -gt 500 ]]; then
    err "$name_dir: SKILL.md is $lines lines (max 500)"
  fi

  [[ "$fail" -eq 0 ]] && ok "$name_dir ($lines lines)"
done

if [[ "$found" -eq 0 ]]; then
  err "no skills found under skills/"
fi

echo "Checking README links..."
if [[ -f README.md ]]; then
  while IFS= read -r path; do
    if [[ -f "$path" ]]; then
      ok "$path"
    else
      err "README links missing file: $path"
    fi
  done < <(grep -oE 'skills/[a-z0-9-]+/SKILL\.md' README.md | sort -u)
fi

echo "Checking skill cross-references..."
xref=0
for f in skills/*/SKILL.md; do
  src="$(basename "$(dirname "$f")")"
  while IFS= read -r ref; do
    [[ -z "$ref" ]] && continue
    xref=$((xref+1))
    if [[ ! -d "skills/$ref" ]]; then
      err "$src: references unknown skill \`$ref\` (no skills/$ref/)"
    fi
  done < <(grep -oE '`[a-z0-9-]+` skill' "$f" | sed -E 's/`([a-z0-9-]+)` skill/\1/')
done
[[ "$fail" -eq 0 ]] && ok "$xref cross-references all resolve"

echo
if [[ "$fail" -eq 0 ]]; then
  printf '\033[32mAll skills valid (%d).\033[0m\n' "$found"
else
  printf '\033[31mValidation failed.\033[0m\n'
fi
exit "$fail"
