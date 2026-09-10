# AGENTS.md

## Structure

- GNU Stow dotfiles. Every top-level directory is a stow package that mirrors `$HOME` (e.g. `hypr/.config/hypr/` → `~/.config/hypr/`). See `README.md:1`.
- No build/test/lint. Only `Justfile` is executable config.
- `opencode/.config/opencode/node_modules` is gitignored (`.gitignore:1`), opencode config is `opencode/.config/opencode/opencode.jsonc`.

## Commands

- `just update` — only recipe. Does `stow -R` for every non-hidden non-empty top-level dir, then `git add -A && git commit -m "update YYYY-MM-DD HH:MM:SS"` if staged changes exist, then `git push`. Source of truth: `Justfile:4`.
- Do not add new just recipes without user request — user explicitly wants a single command (`Justfile` was simplified on purpose).
- Verify with `just --list`. Stow dry-run manually: `stow -n -v -R <pkg>`.

## Fonts

- Single source of truth: `fontconfig/.config/fontconfig/fonts.conf`. Base family is named exactly once there (`sans-serif` → Nerd Propo for UI, `monospace` → Nerd Mono for terminal, plus Noto Color Emoji + Font Awesome fallback).
- fontconfig/pango apps (foot, waybar, wofi, mako, gtk) must use the generic `monospace`/`sans-serif` aliases, never a hardcoded family. A future family swap is then a 3-line change in `fonts.conf`.
- Exception: `zed/.config/zed/settings.json` needs real family names (`buffer_*` → Nerd Mono, `ui_*` → Nerd Propo) — Zed does not resolve generic aliases and Mono-vs-Propo can only be expressed explicitly.
- Sizes are per-app (pt vs px differ, no central mechanism): foot 12, waybar 14px, wofi 24px, gtk 11, mako 12, zed buffer 15 / UI 16.
- Requirements for a base family: nerd-patched, OSS-licensed, ships both Mono and Propo variants.
- Never hand-edit `packages-*.txt` — `.scripts/package-report.sh` regenerates them from `pacman`/`flatpak` on every `just update`.

## Conventions

- Keep `Justfile` minimal and in English. Commit message format is `update <timestamp>`.
- Keep `README.md` to ~3 lines (stow + just summary) — user wants it short.
- Adding a package: `mkdir -p <pkg>/.config/<pkg>` + add files, then `just update` handles linking.
- Push target is `origin` via SSH (`git@github.com:DanteZulli/dotfiles.git`). No CI.
