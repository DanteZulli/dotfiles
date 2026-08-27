# AGENTS.md

## Structure
- GNU Stow dotfiles. Every top-level directory is a stow package that mirrors `$HOME` (e.g. `hypr/.config/hypr/` → `~/.config/hypr/`). See `README.md:1`.
- No build/test/lint. Only `Justfile` is executable config.
- `opencode/.config/opencode/node_modules` is gitignored (`.gitignore:1`), opencode config is `opencode/.config/opencode/opencode.jsonc`.

## Commands
- `just update` — only recipe. Does `stow -R` for every non-hidden non-empty top-level dir, then `git add -A && git commit -m "update YYYY-MM-DD HH:MM:SS"` if staged changes exist, then `git push`. Source of truth: `Justfile:4`.
- Do not add new just recipes without user request — user explicitly wants a single command (`Justfile` was simplified on purpose).
- Verify with `just --list`. Stow dry-run manually: `stow -n -v -R <pkg>`.

## Conventions
- Keep `Justfile` minimal and in English. Commit message format is `update <timestamp>`.
- Keep `README.md` to ~3 lines (stow + just summary) — user wants it short.
- Adding a package: `mkdir -p <pkg>/.config/<pkg>` + add files, then `just update` handles linking.
- Push target is `origin` via SSH (`git@github.com:DanteZulli/dotfiles.git`). No CI.
