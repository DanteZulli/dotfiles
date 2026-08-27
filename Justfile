set shell := ["bash", "-cu"]
dotdir := justfile_directory()

update:
    #!/usr/bin/env bash
    set -euo pipefail
    cd "{{dotdir}}"
    for dir in */; do
        pkg="${dir%/}"
        [[ "$pkg" == ".*" ]] && continue
        [[ ! -d "$pkg" ]] && continue
        [ -z "$(ls -A "$pkg" 2>/dev/null)" ] && continue
        stow -R -v "$pkg" 2>&1 | sed 's/^/  /'
    done
    git add -A
    if git diff --cached --quiet; then
        echo "No changes to commit."
        if [ -n "$(git log --branches --not --remotes 2>/dev/null)" ]; then git push; fi
        exit 0
    fi
    msg="update $(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "$msg"
    git push
