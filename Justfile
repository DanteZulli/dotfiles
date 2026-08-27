# Dotfiles - Justfile
# Uso: just update  -> stow + commit + push todo de una
#      just --list  -> ver comandos

set shell := ["bash", "-cu"]

# Directorio del Justfile (~/dotfiles)
dotdir := justfile_directory()

# Lista comandos por defecto
default:
    @just --list

# Linkea / relinkea todos los paquetes con stow (detecta carpetas automáticamente)
stow:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{dotdir}}"
    echo "==> Stow: relinkeando paquetes..."
    for dir in */; do
        pkg="${dir%/}"
        # ignorar archivos sueltos y ocultos
        [[ "$pkg" == ".*" ]] && continue
        [[ ! -d "$pkg" ]] && continue
        # solo stowear si parece paquete (tiene algo adentro)
        if [ -z "$(ls -A "$pkg" 2>/dev/null)" ]; then continue; fi
        echo "  -> stow -R $pkg"
        stow -R -v "$pkg" 2>&1 | sed 's/^/     /'
    done
    echo "==> Listo."

alias link := stow
alias relink := stow

# Muestra qué haría stow sin tocar nada
dry:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{dotdir}}"
    for dir in */; do
        pkg="${dir%/}"
        [[ "$pkg" == ".*" ]] && continue
        [[ ! -d "$pkg" ]] && continue
        echo "== $pkg (dry-run) =="
        stow -n -v -R "$pkg" 2>&1 | sed 's/^/  /' || true
    done

# Deslinkea un paquete: just unlink waybar
unlink pkg:
    stow -D -v {{pkg}}

# Estado git rápido
status:
    @git -C "{{dotdir}}" status --short --branch
    @echo "---"
    @git -C "{{dotdir}}" diff --stat
    @echo "---"
    @git -C "{{dotdir}}" ls-files --others --exclude-standard

# El comando gordo: stow + commit + push
update:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{dotdir}}"

    echo "==> [1/3] Stow: linkeando paquetes nuevos y existentes..."
    for dir in */; do
        pkg="${dir%/}"
        [[ "$pkg" == ".*" ]] && continue
        [[ ! -d "$pkg" ]] && continue
        if [ -z "$(ls -A "$pkg" 2>/dev/null)" ]; then continue; fi
        # evitar stowear archivos sueltos del root como README/Justfile
        if [ ! -e "$pkg" ]; then continue; fi
        echo "  -> stow -R $pkg"
        stow -R -v "$pkg" 2>&1 | sed 's/^/     /'
    done

    echo "==> [2/3] Git: preparando commit..."
    git add -A

    if git diff --cached --quiet; then
        echo "  No hay cambios para commitear. Nada que hacer."
    else
        msg="update $(date '+%Y-%m-%d %H:%M:%S')"
        echo "  Commit: \"$msg\""
        git commit -m "$msg"
        echo "==> [3/3] Push..."
        git push
        echo "==> Done: $msg"
        exit 0
    fi

    echo "==> [3/3] Push (por si hay commits locales no pusheados)..."
    # solo pushea si hay commits por delante del remoto
    if [ -n "$(git log --branches --not --remotes 2>/dev/null)" ]; then
        git push
        echo "==> Push hecho."
    else
        echo "  Nada para pushear."
    fi

# Solo commit+push sin stow (por si ya linkeaste a mano)
commit-push:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{dotdir}}"
    git add -A
    if git diff --cached --quiet; then
        echo "No hay cambios."
        exit 0
    fi
    msg="update $(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "$msg" && git push
    echo "Done: $msg"

# Adoptar configs existentes de ~ hacia el repo: just adopt waybar
adopt pkg:
    stow --adopt -v {{pkg}}
    @echo "¡Revisá con 'git diff' y 'git status' antes de commitear! El --adopt movió archivos de ~ a dotfiles."
