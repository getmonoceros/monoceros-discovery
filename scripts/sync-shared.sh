#!/bin/sh
# Copies the shared files into the skills that carry them (see shared/targets.txt).
#
#   scripts/sync-shared.sh            copy in the working tree
#   scripts/sync-shared.sh --check    report copies that differ, exit 1 if any
#   scripts/sync-shared.sh --staged   pre-commit: copy the staged source and
#                                     stage the copies
#
# A copy that was edited directly is never overwritten: the script stops and
# names it, because that edit belongs in the shared file.

set -eu

mode=${1:-sync}
case $mode in
  sync | --check | --staged) ;;
  *) echo "usage: $0 [--check | --staged]" >&2; exit 2 ;;
esac

root=$(git rev-parse --show-toplevel)
cd "$root"

status=0
staged_changes=$(git diff --cached --name-only)

is_staged_change() {
  printf '%s\n' "$staged_changes" | grep -Fxq "$1"
}

changed_since_head() {
  ! git diff --quiet HEAD -- "$1" 2>/dev/null
}

stop() {
  echo "sync-shared: $1" >&2
  echo "  Edit $2 and run scripts/sync-shared.sh." >&2
  status=1
}

while read -r entry skills; do
  case $entry in '' | '#'*) continue ;; esac
  plugin=${entry%%/*}
  path=${entry#*/}
  src=shared/$entry

  for skill in $skills; do
    dst=plugins/$plugin/skills/$skill/$path

    case $mode in
      --check)
        if ! cmp -s "$src" "$dst"; then
          echo "differs: $dst" >&2
          status=1
        fi
        ;;

      sync)
        cmp -s "$src" "$dst" && continue
        # Copy changed, source not: the copy was edited directly.
        if [ -e "$dst" ] && changed_since_head "$dst" && ! changed_since_head "$src"; then
          stop "$dst was edited directly." "$src"
          continue
        fi
        mkdir -p "$(dirname "$dst")"
        cp "$src" "$dst"
        echo "copied: $dst"
        ;;

      --staged)
        src_blob=$(git rev-parse ":$src")
        dst_blob=$(git rev-parse -q --verify ":$dst" || true)
        [ "$src_blob" = "$dst_blob" ] && continue
        if is_staged_change "$dst" && ! is_staged_change "$src"; then
          stop "$dst is staged with changes of its own." "$src"
          continue
        fi
        if [ -e "$dst" ] && ! git diff --quiet -- "$dst"; then
          stop "$dst has unstaged changes." "$src"
          continue
        fi
        mkdir -p "$(dirname "$dst")"
        git show ":$src" > "$dst"
        git add "$dst"
        echo "sync-shared: staged $dst"
        ;;
    esac
  done
done < shared/targets.txt

exit $status
