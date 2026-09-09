# Global Instructions

Applied to every opencode session (global `~/.config/opencode/AGENTS.md`).

## Language

- Always write code, comments, commit messages, and documentation in **English**, regardless of the language the user speaks (e.g., Spanish).
- Chat responses may be in the user's language, but all artifacts (code/comments/docs/commits) stay in English.

## Commits - Conventional Commits

- Always use **Conventional Commits** spec: https://www.conventionalcommits.org/en/v1.0.0/
- Format: `type(scope): description`
  - `type`: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`
  - `scope` optional, lowercase (e.g., `feat(auth): add jwt refresh`)
  - `description`: imperative mood, lowercase, no trailing period, <=72 chars header
  - Body/footer optional: wrap at 72 chars, use `BREAKING CHANGE:` footer when needed
- Examples: `feat: add user auth`, `fix(api): handle null token`, `chore(deps): bump zod`

## Tools - Prefer Optimized Modern Alternatives

- Prefer modern tools over legacy ones when available, fallback gracefully if missing:
  - `rg` (ripgrep) over `grep`/`rgrep`
  - `fd` over `find`
  - `jq`/`yq` over manual JSON/YAML parsing
  - `sd` over `sed` for replacements
  - `bat` over `cat` for preview
  - `eza`/`lsd` over `ls` when listing with details
  - `ast-grep`/`rg --type` for code-aware search

## General

- Keep changes minimal and focused. Verify with tests/build when relevant.
- For library or framework documentation, prefer the `context7-cli` skill (`ctx7 docs`) over training data whenever docs may be outdated.

## Privileged Commands

- `sudo` requires an interactive password and cannot complete from an agent shell. Use `pkexec` instead.
- `pkexec` prompts for approval via the running polkit agent (`hyprpolkitagent`). Each invocation pops a GUI dialog the user must accept, so announce it before running and keep privileged commands one at a time.
- Never add `NOPASSWD` sudo rules, and never ask for or store the user password.
