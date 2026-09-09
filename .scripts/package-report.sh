#!/usr/bin/env bash
# Regenerate package inventory files tracked in git.
# Runs as part of `just update`. The git history of these
# files shows what was installed or removed and when,
# e.g. `git log -p packages-explicit.txt`.
set -euo pipefail
cd "$(dirname "$0")/.."

pacman -Qeq | sort -u > packages-explicit.txt
pacman -Qmq | sort -u > packages-foreign.txt
if command -v flatpak >/dev/null 2>&1; then
    flatpak list --app --columns=application 2>/dev/null | sort -u > packages-flatpak.txt
fi

# Short summary: counts plus added/removed since last commit.
for f in packages-explicit.txt packages-foreign.txt packages-flatpak.txt; do
    [ -f "$f" ] || continue
    echo "$f: $(grep -c . "$f" || true) packages"
    if git cat-file -e "HEAD:$f" 2>/dev/null; then
        added=$(comm -13 <(git show "HEAD:$f" | sort -u) <(sort -u "$f") || true)
        removed=$(comm -23 <(git show "HEAD:$f" | sort -u) <(sort -u "$f") || true)
        [ -n "$added" ] && echo "$added" | sed 's/^/  + /'
        [ -n "$removed" ] && echo "$removed" | sed 's/^/  - /'
    else
        echo "  (new file, no previous version to compare)"
    fi
done

exit 0
