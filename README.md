# Dotfiles — Stow Cheatsheet

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Stow only creates symlinks from `~/dotfiles/<package>` → `~`.

```
bash/     -> ~/.bashrc, ~/.bash_profile
git/      -> ~/.gitconfig
hypr/     -> ~/.config/hypr
foot/     -> ~/.config/foot
waybar/   -> ~/.config/waybar
zed/      -> ~/.config/zed
opencode/ -> ~/.config/opencode
nano/     -> ~/.nanorc
```

Run all from `~/dotfiles`:

```bash
stow -v <pkg>          # link package
stow -v hypr foot      # multiple
stow -n -v <pkg>       # dry-run (simulate)
stow -D -v <pkg>       # unlink
stow -R -v <pkg>       # relink (after adding files)
stow --adopt -v <pkg>  # move existing files in ~ into dotfiles (check git diff after)
```

### Workflow

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

### Fix & Verify

```bash
# "existing target is not owned by stow" → mv ~/.config/<thing> ~/dotfiles/<pkg>/.config/<thing> first
ls -l ~/.config ~/.bashrc ~/.gitconfig  # should show -> dotfiles/...
git status
```
