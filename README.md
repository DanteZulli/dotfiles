# Dotfiles — Stow Cheatsheet

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Stow creates symlinks from `~/dotfiles/<package>` → `~`.

```bash
stow -v <pkg>          # link package
stow -v hypr foot      # multiple
stow -n -v <pkg>       # dry-run (simulate)
stow -D -v <pkg>       # unlink
stow -R -v <pkg>       # relink (after adding files)
stow --adopt -v <pkg>  # move existing files in ~ into dotfiles (check git diff after)
```

## Workflow

```bash
# Edit — ~/.config/hypr and ~/dotfiles/hypr/.config/hypr are the same file
cd ~/dotfiles && git diff && git commit -am "update"

# Add file to existing package
nvim hypr/.config/hypr/new.conf
stow -R -v hypr
git add hypr/.config/hypr/new.conf && git commit -m "Add hypr conf"

# Add new program
mkdir -p newpkg/.config/newpkg
nvim newpkg/.config/newpkg/config
stow -n -v newpkg && stow -v newpkg
git add newpkg && git commit -m "Add newpkg"

# Remove
stow -D -v waybar
```
