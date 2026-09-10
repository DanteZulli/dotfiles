# AGENTS.md

- GNU Stow repo: every top-level dir is a package mirroring `$HOME`.
- Edit files, then run `just update` — it restows, regenerates `packages-*.txt`, commits, and pushes. Never `git commit`/`push` manually, never hand-edit `packages-*.txt`.
- `Justfile` owns commit messages (timestamp); the global Conventional Commits rule does not apply here. Don't add just recipes.
- `packages-*.txt` are script-generated inventory (pacman/flatpak via `.scripts/package-report.sh`); never hand-edit.
- This repo is the source of truth: work on tracked files only. If `~/.config` has something missing here, import it into the matching stow package instead of editing home directly.
- Stay aligned with the user; when in doubt, ask before changing, committing, or pushing.
