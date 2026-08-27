# Dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/) + [just](https://github.com/casey/just). Each folder is a stow package (`~/dotfiles/<pkg>` → `~`).

Just edit/add files and run `just update` — it restows everything, commits with timestamp, and pushes.
