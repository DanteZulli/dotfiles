# AGENTS.md

## Structure

- GNU Stow dotfiles. Every non-hidden, non-empty top-level dir is a stow package mirroring `$HOME` — both dotfile roots (`bash/.bashrc` → `~/.bashrc`) and config trees (`hypr/.config/hypr/` → `~/.config/hypr/`).
- No build/test/lint. Only executable entrypoint is `just update` (`Justfile`); its helper `.scripts/package-report.sh` regenerates `packages-*.txt` from `pacman`/`flatpak`.
- `opencode` pkg: config is `opencode.jsonc` (loads global + repo `AGENTS.md`); `node_modules`, `package.json`, lockfiles are gitignored by the nested `.gitignore` — never force-add them.

## Commands

- Workflow is edit files, then `just update` — it restows all packages, regenerates `packages-*.txt`, commits, and pushes. Never `git commit`/`git push` manually and never hand-edit `packages-*.txt`.
- Commit messages are owned by `Justfile` (`update YYYY-MM-DD HH:MM:SS`); the global Conventional Commits rule does not apply here.
- Do not add new just recipes without user request — user explicitly wants a single command (`Justfile` was simplified on purpose).
- Verify with `stow -n -v -R <pkg>` dry-run before `just update` when touching package layout.

## Fonts

- Single source of truth: `fontconfig/.config/fontconfig/fonts.conf`. Base family is named exactly once there (`sans-serif` → Nerd Propo for UI, `monospace` → Nerd Mono for terminal, plus Noto Color Emoji + Font Awesome fallback).
- fontconfig/pango apps (foot, waybar, wofi, mako, gtk) must use the generic `monospace`/`sans-serif` aliases, never a hardcoded family. A future family swap is then a 3-line change in `fonts.conf`.
- Exception: `zed/.config/zed/settings.json` and `qt5ct`/`qt6ct` need real family names (`Mono` for code/fixed, `Propo` for UI/general) — those stacks do not reliably resolve generic aliases and Mono-vs-Propo can only be expressed explicitly.
- GTK also reads dconf: `org.gnome.desktop.interface font-name` / `monospace-font-name` override `settings.ini`, so keep them on the generic aliases via `gsettings set` (one-time runtime state, not a repo file).
- Sizes are per-app (pt vs px differ, no central mechanism): foot 12, waybar 14px, wofi 24px, gtk 11, mako 12, zed buffer 15 / UI 16.
- Requirements for a base family: nerd-patched, OSS-licensed, ships both Mono and Propo variants.

## Conventions

- Keep `Justfile` minimal and in English.
- Keep `README.md` to ~3 lines (stow + just summary) — user wants it short.
- Adding a package: `mkdir -p <pkg>/.config/<pkg>` + add files, then `just update` handles linking.
- Push target is `origin` via SSH (`git@github.com:DanteZulli/dotfiles.git`). No CI.
