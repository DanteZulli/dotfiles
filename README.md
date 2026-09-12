# Dotfiles

Arch Hyprland setup managed with [GNU Stow](https://www.gnu.org/software/stow/) + [just](https://github.com/casey/just). Each top-level folder is a stow package: `~/dotfiles/<pkg>` stows to `~`.

## Layout

| Package | Target |
|---|---|
| `agents` | `~/.agents/skills/` (opencode/agent skills: context7-cli, tdd, find-skills) |
| `bash` | `~/.bashrc`, `~/.bash_profile`, `~/.bash_logout` |
| `fontconfig`, `foot`, `gtk`, `kvantum`, `qt5ct`, `qt6ct` | fonts, terminal, theming |
| `git` | `~/.gitconfig` |
| `hypr` | `~/.config/hypr/` (`hyprland.lua` + `hyprland/` modules, `hyprpaper.conf`, `hyprsunset.conf`) |
| `mako`, `waybar`, `wofi` | notifications, bar (`config.jsonc` + css), launcher |
| `mangohud`, `voxtype`, `zed`, `nano` | `~/.config/MangoHud/`, `~/.config/voxtype/`, `~/.config/zed/`, `~/.nanorc` |
| `opencode` | `~/.config/opencode/` (whole-dir symlink: `AGENTS.md` global instructions + `opencode.jsonc`) |

Meta: `Justfile` (restow + commit + push), `.scripts/package-report.sh` (inventory generator), `packages-*.txt` (generated inventory), `AGENTS.md` (agent instructions).

## Daily use

Edit files in `~/dotfiles/<pkg>/...`, test with `stow -R -v <pkg>`, then persist:

```bash
just update
```

`just update` restows every package, regenerates `packages-*.txt`, runs `git add -A`, commits with `update YYYY-MM-DD HH:MM:SS` if changed, and pushes (also pushes pending commits when clean).

## Add a new dotfile

1. Place it under `<pkg>/...` mirroring `$HOME` (new tool = new top-level dir).
2. `stow -n -v <pkg>` to preview, then `stow -R -v <pkg>` to link.
3. `just update` to commit + push.

## Fresh machine (Arch)

```bash
sudo pacman -S stow just git
git clone git@github.com:DanteZulli/dotfiles.git ~/dotfiles
cd ~/dotfiles && just update
```

Then reinstall opencode plugins (`node_modules/` is git-ignored): `cd ~/.config/opencode && npm install` (or `bun install`).

## Package inventory

`packages-explicit.txt` (`pacman -Qeq`), `packages-foreign.txt` (`pacman -Qmq`), `packages-flatpak.txt` (`flatpak list --app`) are auto-regenerated on every `just update`. Check history with `git log -p packages-explicit.txt`. Never hand-edit.
