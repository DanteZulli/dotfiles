# Dotfiles — Guía Stow

Repo gestionado con [GNU Stow](https://www.gnu.org/software/stow/). Stow solo crea symlinks de `~/dotfiles/<paquete>` hacia `~`.

## Estructura

```
~/dotfiles/
├── bash/.bashrc, .bash_profile, .bash_logout -> ~/.bashrc, etc
├── git/.gitconfig                             -> ~/.gitconfig
├── hypr/.config/hypr/                         -> ~/.config/hypr
├── foot/.config/foot/                         -> ~/.config/foot
├── waybar/.config/waybar/                     -> ~/.config/waybar
├── zed/.config/zed/                           -> ~/.config/zed
├── opencode/.config/opencode/                 -> ~/.config/opencode
└── nano/.nanorc                               -> ~/.nanorc
```

Cada carpeta de primer nivel es un **paquete** stow.

## Comandos básicos

Todos se corren desde `~/dotfiles`:

```bash
cd ~/dotfiles

# Instalar (linkear) un paquete
stow -v <paquete>
stow -v hypr

# Instalar varios
stow -v hypr foot waybar

# Simular sin tocar nada (dry-run) — usar siempre antes si dudas
stow -n -v <paquete>

# Quitar symlinks de un paquete (sin borrar archivos en dotfiles)
stow -D -v <paquete>

# Re-linkear (útil después de agregar archivos nuevos al paquete)
stow -R -v <paquete>

# Adoptar archivos existentes en ~ hacia dotfiles (los mueve)
stow --adopt -v <paquete>
# Ojo: --adopt sobreescribe el archivo en dotfiles con el de ~
# Hacer git diff después y commitear solo si estás seguro

# Opciones explícitas (si no estás en ~/dotfiles)
stow -d ~/dotfiles -t ~ -v <paquete>
```

## Workflow diario

### Editar algo existente
Edita `~/.config/hypr/hyprland.lua` o `~/dotfiles/hypr/.config/hypr/hyprland.lua` — es el mismo archivo por el symlink.
```bash
cd ~/dotfiles
git diff
git commit -am "tweak hypr"
```

### Agregar un archivo nuevo a un paquete existente
```bash
# ej: agregar un nuevo config a hypr
nvim ~/dotfiles/hypr/.config/hypr/nuevo.conf
stow -R -v hypr
git add hypr/.config/hypr/nuevo.conf && git commit -m "Add hypr nuevo.conf"
```

### Agregar un programa nuevo (ej: nano)
```bash
mkdir -p ~/dotfiles/nano
nvim ~/dotfiles/nano/.nanorc        # para ~/.nanorc
# o: mkdir -p ~/dotfiles/nano/.config/nano && nvim ~/dotfiles/nano/.config/nano/nanorc

stow -n -v nano   # probar
stow -v nano      # linkear
ls -l ~/.nanorc   # verificar -> dotfiles/nano/.nanorc

git add nano && git commit -m "Add nano config"
```

### Quitar un programa del sistema (manteniendo backups en dotfiles)
```bash
stow -D -v waybar
# ~/.config/waybar ya no es symlink
```

## Tips

- Si `stow` falla con `existing target is not owned by stow`, es porque `~/.config/algo` ya existe como carpeta/archivo real. Muévelo a `~/dotfiles/<paquete>/` primero o usa `--adopt`.
- `~/.config` y `~` ya existen como directorios, stow solo linkea *dentro* de ellos.
- No trackees `mozilla/`, `pulse/`, `dconf/`, `node_modules/` — son cache/estado.
- `git` es independiente: `stow` no hace commits. Todo el git se hace normal en `~/dotfiles`.

## Verificación

```bash
ls -l ~/.config          # symlinks -> ../dotfiles/...
ls -l ~/.bashrc ~/.gitconfig ~/.nanorc
stow -n -v <paquete>     # dry-run antes de cambios grandes
git -C ~/dotfiles status
```
